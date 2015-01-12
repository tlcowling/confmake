require 'confswap/bash_parser'

describe 'Confswap::BashParser' do
  describe 'normal string' do
    it 'should not try to parse a normal string' do
      normal_string = Confswap::BashParser.parse 'normal_string'
      expect(normal_string).to be_kind_of String
      expect(normal_string).to_not be_nil
    end
  end
  describe 'Parsing arrays' do
    it 'should attempt to convert a string starting with a [ to a ruby array object' do
      parsed_array = Confswap::BashParser.parse '[1,2,3,4]'
      expect(parsed_array).to be_kind_of Array
      expect(parsed_array).to eq([1,2,3,4])
    end

    it 'should leave unparseable array as a string' do
      invalid_array_string = Confswap::BashParser.parse '[1,2'
      expect(invalid_array_string).to be_kind_of String
      expect(invalid_array_string).to eq("[1,2")
    end
  end

  describe 'Ruby hash' do
    it 'should attempt to convert a string starting with a { to a ruby hash, but leave as a string if not possible' do
      parsed_array = Confswap::BashParser.parse '{"a": "1", "b": "2", "c": "3", "d": "4"}'
      expect(parsed_array).to be_kind_of Hash
      expect(parsed_array).to eq({"a" => "1", "b" => "2", "c" => "3", "d" => "4"})
    end
    it 'should leave unparseable object as string' do
      parsed_array = Confswap::BashParser.parse '{a: 1, b: 2, c: 3, d:'
      expect(parsed_array).to be_kind_of String
      expect(parsed_array).to eq('{a: 1, b: 2, c: 3, d:')
    end
  end

  describe 'Whole User Input' do
    it 'should parse envvars and convert array strings and hash strings to ruby object' do
      user_input = {
        :ARRAY   => "[1,2,3,4]",
        :TEST    => "test",
        :OBJECT  => "{}",
      }
      parsed_input = Confswap::BashParser.parse_user_input user_input
      expect(parsed_input).to be_kind_of Hash
      expect(parsed_input).to eq({
        "ARRAY"  => [1,2,3,4],
        "TEST"   => "test",
        "OBJECT" => {},
      })
    end
  end
end
