# /usr/bin/env ruby
# encoding: utf-8

require 'simplecov'
SimpleCov.start

def sample_config
  [ "# This is a sample config",
    "# A bunch of lines that will be in a file",
    "# Because thats what its all about",
    "test=%{ITEM1}",
    "test2=%{ITEM2}",
    "test3=%{ITEM3}"
  ].join("\n")
end

def sample_variables
  { :ITEM1 => "localhost", :ITEM2 => "8.8.8.8", :ITEM3 => 1 }
end

def tmp_dir
  File.expand_path(File.dirname(__FILE__)) + '/tmp'
end
