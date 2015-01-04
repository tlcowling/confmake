require 'clamp'
require 'confswap'

module Confswap
  class Command < Clamp::Command

    @env_variables

    def initialize *args
      super *args
    end

    def help *args
      return [
        "This is confswap version #{Confswap::VERSION}",
        super
      ].join("\n")
    end

    def run *args
      super *args
    end

    def execute
      if version?
        puts Confswap::VERSION
        return 0 
      end

      if configuration_filename.nil?
        puts 'Specify a template file or use --help for usage information'
        return 0
      end

      if File.exists? configuration_filename
        swap_config configuration_filename
        return 0
      else
        puts "Error: Configuration template file with name #{configuration_filename} does not exist"
        return 1
      end
    end

    def swap_config configuration_filename
      output_filename_default = configuration_filename + '.out' if output_filename.nil?

      configuration_template = Confswap::ConfigurationFileReader.read configuration_filename
      @env_variables = Confswap::EnvironmentVariableReader.read_variables

      process_envvars() if envvars

      if !property_file.nil? and File.exists? property_file
        puts 'pfile specified'
        @env_variables = Confswap::PropertyFileVariableReader.read_variables_from_file property_file
        puts @env_variables
      end
      
      begin
        output = configuration_template % @env_variables
      rescue KeyError => error
        puts "#{error.message}.  Your configuration requires this variable, but no environment variable was found or specified."
        exit(1)
      end

      write_file output, output_filename || output_filename_default
    end

    def process_envvars
      envvars.each { |envvar|
        key_and_value = envvar.split(/=/, 2)
        key = key_and_value.first
        value = key_and_value.last
        if key_and_value.count != 2
          puts "Invalid envvar specified #{key} and #{value}"
          return 1
        end

        @env_variables[key.to_sym]=value
      }

      if verbose?
        puts "Environment variables:"
        @env_variables.each { |var|
          puts "#{var.first} = #{var.last}"
        }
      end
    end

    def write_file output_file_contents, output_filename
      return File.write output_filename, output_file_contents unless File.exists? output_filename
      
      if File.exists? output_filename and force?
        puts "Overwriting #{output_filename}..."
        File.write output_filename, output_file_contents
      else
        puts "#{output_filename} already exists, use the --force flag to overwrite"
      end
    end

    option ['-t', '--template'], "TEMPLATE PATH", 'The path to the configuration template', :attribute_name => :configuration_filename
    option ['-p', '--property-file'], "FILE PATH", 'A path to a property file to use for your template variables', :attribute_name => :property_file
    option ['-e', '--envvar'], "VARIABLE", 'Specify one or more additional environment variables in the form KEY=VALUE', :multivalued => true, :attribute_name => :envvars
    option ['-f','--force'], :flag, "Overwrite file if it already exists", :attribute_name => :force
    option ['-v', '--version'], :flag, "The version of confswap you are running", :attribute_name => :version
    option ['--verbose'], :flag, "Be more verbose"
    parameter "[OUTPUT FILE]", "Path to the configuration file", :attribute_name => :output_filename, :default => "your.conf"
  end
end
