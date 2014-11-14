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

			  
    end
		
		option ['-r','--replace'], :flag, "Replace (Overwrite) the template file withe variable filled output", :attribute_name => :force
		option ['-v', '--version'], :flag, "The version of confswap you are running"
    option ['-o', '--output'], "FILE", "Writes the output from a config to a file", :attribute_name => :output_file
		option ['--verbose'], :flag, "Be more verbose"

		parameter "TEMPLATE_FILE", "Path to the configuration file", :attribute_name => :configuration_filepath
  end
end
