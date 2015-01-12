require 'confmake/env_reader'

describe 'Confmake::EnvironmentVariableReader' do
  it 'should read environment variables and store them in a hash' do
    env_variables = Confmake::EnvironmentVariableReader.read_variables
    expect(env_variables).to be_instance_of Hash
  end
  it 'should store the environment variable FOO=bar in a hash' do
    ENV['FOO']="bar"
    expect(Confmake::EnvironmentVariableReader.read_variables).to include(:FOO => "bar")
  end
end
