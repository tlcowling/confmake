require 'confswap/conf_reader'
require_relative './spec_helper.rb'

describe 'Confswap::ConfigFileReader' do
  before(:each) do
    File.write('/tmp/test.txt', sample_config)
  end

  it 'should read the contents of a file specified' do 
    expect(Confswap::ConfigurationFileReader.read '/tmp/test.txt').to eql(sample_config)
  end

  it 'should return nil if the file does not exist' do
    expect(Confswap::ConfigurationFileReader.read '/path/does/not/exist.txt').to be_nil
  end

  after(:each) do
    File.delete('/tmp/test.txt') if File.exists?('/tmp/test.txt')
  end
end
