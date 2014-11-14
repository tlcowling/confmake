module Confswap
  class ConfigurationFileReader
    def self.read config_file_path
      return File.read config_file_path if File.exists? config_file_path
    end
  end
end
