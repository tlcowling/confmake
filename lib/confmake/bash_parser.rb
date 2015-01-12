require 'json'

module Confmake
  class BashParser
    def self.parse_user_input user_input
      parsed_input = {}
      user_input.each { |k,v|
        parsed_input[k.to_s] = self.parse v
      }
      parsed_input
    end

    def self.parse text
      parsed_text = text
      parsed_text = parse_as_array text if text.start_with? "["
      parsed_text = parse_as_object text if text.start_with? "{"
      parsed_text
    end

    private
    def self.parse_as_array text
      parse_as_json_string text
    end

    def self.parse_as_object text
      parse_as_json_string text
    end

    def self.parse_as_json_string text
      begin
        return JSON.parse text
      rescue JSON::ParserError
        return text
      end
    end
  end
end
