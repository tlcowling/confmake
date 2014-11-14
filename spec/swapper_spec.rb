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
		expect(@test_swapper.render_input '').to eql('')

		@test_swapper.variables = sample_variables
		expect(@test_swapper.render_input '').to eql('')
	end

	it 'should replace the variable with notation %{ITEM1}' do
		sample_input = "# This is a sample config string \n host: %{ITEM1}"
    @test_swapper.variables = sample_variables
		expect(@test_swapper.render_input sample_input).to eql("# This is a sample config string \n host: localhost")
	end

	def sample_variables
		{ :ITEM1 => "localhost", :ITEM2 => "8.8.8.8" }
	end
end
