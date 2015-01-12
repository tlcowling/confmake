module Confmake
  class ConfigurationFileReader
    def self.read config_file_path
      File.read config_file_path if File.exists? config_file_path
    end
  end
end
