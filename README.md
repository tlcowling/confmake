# confswap [![Build Status](https://travis-ci.org/tlcowling/confswap.svg?branch=master)](https://travis-ci.org/tlcowling/confswap) [![Dependency Status](https://gemnasium.com/tlcowling/confswap.svg)](https://gemnasium.com/tlcowling/confswap) [![Code Climate](https://codeclimate.com/github/tlcowling/confswap/badges/gpa.svg)](https://codeclimate.com/github/tlcowling/confswap) [![Gem Version](https://badge.fury.io/rb/confswap.svg)](http://badge.fury.io/rb/confswap)
:cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow:



A simple command line tool to take a configuration file with template placeholders and replace those placeholders with environment variables.

The variables can come explicitly from the command, or read from a properties file.

## Usage

Configuration files come in different shapes and forms, confswap doesn't care if its toml or yaml

```
# example.conf|.toml|.yaml

# This is a configuration file

giblet_status=%{GIBLETS_STATUS}
splenetic_juice_factor=%{SPLENETIC_JUICE_FACTOR}
``` 

Then run confswap on the file

confswap 

## Requirements

Requires ruby version > 2.0
Bundle install the gems

## Developments

Please feel free to fork and whatnot...

Get the dependencies
``bundle install``

Run the tests
``rake spec`` 

## Thoughts?

Why not just use sed and replace in some kind of bash script?

I originally used this approach but the script grew unwieldy, maybe I don't do good bash or maybe its just because of lack of testing.  Whilst the benefit of a bash script is that it will run as-is on many systems, I find it better to treat a tool like this as software and therefore use the ecosystems already available to manage dependencies and deploy.  I also enjoy programming in ruby :)

## Tasks to do and improvement ideas

- ~~error message when config contains env variable that doesnt exist~~
- ~~acceptance tests~~
- Read config from properties file
- verbose command
- summary of what will change?  dry-run maybe?
- diff on what has changed in a config if overwriting?
- test command.rb
- document...

