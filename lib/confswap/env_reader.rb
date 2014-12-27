module Confswap
  class EnvironmentVariableReader
    def self.read_variables
      Hash[ENV.map { |key, value| [key.to_sym, value] }]
    end
  end
end
