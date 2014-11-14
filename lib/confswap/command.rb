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
		
		option ['-t','--test'], "TEST", "Confswap tests this", :attribute_name => :test
		option ['-v', '--version'], "", "The version of confswap you are running"
  end
end
