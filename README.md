# confswap [![Build Status](https://travis-ci.org/tlcowling/confswap.svg?branch=master)](https://travis-ci.org/tlcowling/confswap) [![Dependency Status](https://gemnasium.com/tlcowling/confswap.svg)](https://gemnasium.com/tlcowling/confswap) [![Code Climate](https://codeclimate.com/github/tlcowling/confswap/badges/gpa.svg)](https://codeclimate.com/github/tlcowling/confswap) [![Gem Version](https://badge.fury.io/rb/confswap.svg)](http://badge.fury.io/rb/confswap)
:cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow:




A simple command line tool to take a configuration file with template placeholders and replace those placeholders with environment variables.

It appears to be taking the shape of a ruby gem...

## Introduction

This is mostly for me to use as a convenience tool when creating docker containers.

When working with elasticsearch, I have used their system for using environment variables in the config, and this has worked very well for me especially when using ENV variables with docker run.

## Usage

Config files can use the `%{}` style to replace a token in a stirng with a variable

`export GIBLET_STATUS=active`
`export SPLENETIC_JUICE_FACTOR=10`

`example.conf|.toml|.yaml`
```
# This is a configuration file
giblet_status=%{GIBLETS_STATUS}
splenetic_juice_factor=%{SPLENETIC_JUICE_FACTOR}
``` 

Then run confswap on the file

## Requirements

Requires ruby version > 2.0
Bundle install the gems

## Developments

Please feel free to fork and whatnot...

Get the dependencies
``bundle install``

Run the tests
``rake spec`` 

### Optional:
Use guard to rerun tests as you go...
``guard``

## Tasks to do and improvement ideas

- ~~error message when config contains env variable that doesnt exist~~
- verbose command
- summary of what will change?  dry-run maybe?
- test command.rb
- ~~acceptance tests~~

- internationalization :) 
- document...
- diff on what has changed in a config if overwriting?

