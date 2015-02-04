# confmake [![Build Status](https://travis-ci.org/tlcowling/confmake.svg?branch=master)](https://travis-ci.org/tlcowling/confmake) [![Dependency Status](https://gemnasium.com/tlcowling/confmake.svg)](https://gemnasium.com/tlcowling/confmake) [![Code Climate](https://codeclimate.com/github/tlcowling/confmake/badges/gpa.svg)](https://codeclimate.com/github/tlcowling/confmake) [![Gem Version](https://badge.fury.io/rb/confmake.svg)](http://badge.fury.io/rb/confmake)

Confmake makes configuration files.

Its a command line tool which procedurally generates configuration files from a template.

So far, you can use
1. Shell environment variables
2. Property Lists

## Usage

``

## Requirements

Requires ruby version >= 2.0

## Developments

Please feel free to fork and whatnot...

Get the dependencies
``bundle install``

Run the tests
``rake spec`` 
``rake features``

## Thoughts?
###The point?

I had the need to procedurally create configuration files when automating the deployment of particular services.

###Why not just use sed and replace in some kind of bash script?

I originally used this approach but the script grew unwieldy, maybe I don't do good bash or maybe its just because of lack of testing.  Whilst the benefit of a bash script is that it will run as-is on many systems, I find it better to treat a tool like this as software and therefore use the ecosystems already available to manage dependencies and deploy.  I also enjoy programming in ruby :)

## Tasks to do and improvement ideas

- ~~error message when config contains env variable that doesnt exist~~ Version 0.0.2
- ~~Read config from properties file~~ Version 0.0.4
- ~~verbose command~~ Version 0.0.5
- ~~YAML~~ Version 0.1.0

### Roadmap
- JSON Version 0.1.1
- proper logging! 0.1.2

- improve verbose messages
- summary of what will change?  dry-run maybe?
- diff on what has changed in a config if overwriting?

