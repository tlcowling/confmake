require 'clamp'
require 'confswap'

module Confswap
  class Command < Clamp::Command
    def initialize(*args)
      super(*args)	
    end
		def help(*args)
      return [
        "This is confswap version #{Confswap::VERSION}",
				super
			].join("\n")
		end

		def run(*args)
      super(*args)
		end

    def execute
       if ARGV == [ "--version" ]
		     puts Confswap::VERSION
	       return 0
       end

			 output_filepath_default = './test.conf.out' if output_filepath.nil?
			 
			 if File.exists? configuration_filepath
			   configuration_template = Confswap::ConfigurationFileReader.read configuration_filepath
			   env_variables = Confswap::EnvironmentVariableReader.read_variables
			   output = configuration_template % env_variables
			   File.write(output_filepath || output_filepath_default , output)
			   return 0
			 else
         puts "Error: Configuration template filepath #{configuration_filepath} does not exist"
				 return 1
			 end
    end
		
		option ['-f','--force'], :flag, "Overwrite file if it already exists"
		option ['-v', '--version'], :flag, "The version of confswap you are running"
    option ['-o', '--output'], "FILE", "Writes the output from a config to a file", :attribute_name => :output_filepath
		option ['--verbose'], :flag, "Be more verbose"

		parameter "TEMPLATE_FILE", "Path to the configuration file", :attribute_name => :configuration_filepath
  end
end
