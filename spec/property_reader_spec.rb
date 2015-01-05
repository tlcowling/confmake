require 'confswap/property_reader'

describe 'Confswap::PropertyFileVariableReader' do
  it 'should split only on first colon and extra newlines' do
    variables = "VAR1: 192.168.0.1\n\n\nVAR2: giblets\nVAR3: this should : : have: colons"
    File.write tmp_dir + '/property_vars', variables
    vars = Confswap::PropertyFileVariableReader.read_variables_from_file tmp_dir + '/property_vars'

    expect(vars).to be_instance_of Hash
    expect(vars.length).to equal(3)
    expect(vars).to eq({
      :VAR1 => '192.168.0.1', 
      :VAR2 => 'giblets', 
      :VAR3 => 'this should : : have: colons' 
    })
    
  end

  it 'should ignore comments in a property file' do
    file_contents = "# this is a comment \nVAR1: 192.168.0.1\n\n\nVAR2: giblets\nVAR3: this should : : have: colons" 
    File.write tmp_dir + '/property_file_with_comments', file_contents
    vars = Confswap::PropertyFileVariableReader.read_variables_from_file tmp_dir + '/property_file_with_comments'
    expect(vars.length).to eq(3)
    expect(vars).to eq({
      :VAR1 => '192.168.0.1',
      :VAR2 => 'giblets',
      :VAR3 => 'this should : : have: colons'
    })
  end

  it 'should warn for invalid property file when property file is empty' do
    file_contents = ""
    File.write tmp_dir + '/invalid_property_file', file_contents
    expect {
      Confswap::PropertyFileVariableReader.read_variables_from_file tmp_dir + '/invalid_property_file'
    }.to raise_exception Confswap::PropertyFileVariableReader::InvalidPropertyFileException
  end

  pending 'should warn for invalid property file when property file is invalid' do
    file_contents = "# this is a comment \nVAR1: "
    File.write tmp_dir + '/invalid_property_file', file_contents
    expect {
      Confswap::PropertyFileVariableReader.read_variables_from_file tmp_dir + '/invalid_property_file'
    }.to raise_exception Confswap::PropertyFileVariableReader::InvalidPropertyFileException
  end
end
