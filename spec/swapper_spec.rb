require 'confswap'

describe 'confswap' do
	before :each do
    @test_swapper = Confswap::Swapper.new
	end

	it 'takes a hash of environment variables' do
		@test_swapper.variables = sample_variables

	end

  it 'should output an empty string for an empty input regardless of variablesdefined' do
		@test_swapper.variables = {}
		@test_swapper.render_input ''

		@test_swapper.variables = sample_variables
		@test_swapper.render_input ''
	end

	def sample_variables
		{ :item1 => "localhost", :item2 => "8.8.8.8" }
	end
end
