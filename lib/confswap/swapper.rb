module Confswap
  class Swapper
    attr_accessor :variables
    def render_input input
			input % variables 
    end				
  end
end
