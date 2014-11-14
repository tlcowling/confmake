#!/usr/bin/env ruby

module Confswap
  class EnvironmentVariableReader
	  def self.read_variables
      ENV.to_hash
	  end
  end
end
