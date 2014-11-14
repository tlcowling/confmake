require 'confswap/env_reader'

describe 'Confswap::EnvironmentVariableReader' do
  it 'should read an environment variable and store it in a hash' do
		env_variables = Confswap::EnvironmentVariableReader.read_variables
		expect(env_variables).to be_instance_of Hash

  end
end
