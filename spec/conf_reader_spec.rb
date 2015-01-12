require 'confmake/conf_reader'
require_relative './spec_helper.rb'

describe 'Confmake::ConfigFileReader' do
  before(:each) do
    File.write(tmp_dir + '/test.txt', sample_config)
  end

  it 'should read the contents of a file specified' do 
    expect(Confmake::ConfigurationFileReader.read tmp_dir + '/test.txt').to eql(sample_config)
  end

  it 'should return nil if the file does not exist' do
    expect(Confmake::ConfigurationFileReader.read '/path/does/not/exist.txt').to be_nil
  end

  after(:each) do
    File.delete(tmp_dir + '/test.txt') if File.exists?(tmp_dir + '/test.txt')
  end
end
