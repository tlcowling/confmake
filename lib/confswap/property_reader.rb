class Confswap::PropertyFileVariableReader
  def self.read_variables_from_file file_path
    contents = File.read file_path
    self.parse_file_contents contents
  end

  private
  def self.parse_file_contents contents
    raise InvalidPropertyFileException unless self.valid_property_file_contents? contents
    raw_file_contents = contents.split(/\n/)
    variables = self.ignore_blank_or_comment_lines(raw_file_contents)
    variables_hash = {}

    variables.each { |variable_line|
      split_variable_line = variable_line.split(/:/, 2)
      variable_key = split_variable_line.first.to_sym
      variable_value = split_variable_line.at(1).strip

      variables_hash[variable_key] = variable_value
    }
    
    variables_hash
  end

  def self.ignore_blank_or_comment_lines file_contents
    file_contents.reject{|v| v.empty? || self.comment_line?(v) }
  end

  def self.comment_line? line
    line.start_with? '#'
  end
  
  def self.valid_property_file_contents? property_file_contents
    file_contents_not_empty = !property_file_contents.empty?
    file_contents_not_empty
  end
end

class Confswap::PropertyFileVariableReader::InvalidPropertyFileException < Exception
  def initalize message
    super message
  end
end


