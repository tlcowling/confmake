# confswap [![Build Status](https://travis-ci.org/tlcowling/confswap.svg?branch=master)](https://travis-ci.org/tlcowling/confswap) [![Dependency Status](https://gemnasium.com/tlcowling/confswap.svg)](https://gemnasium.com/tlcowling/confswap) [![Code Climate](https://codeclimate.com/github/tlcowling/confswap/badges/gpa.svg)](https://codeclimate.com/github/tlcowling/confswap) [![Gem Version](https://badge.fury.io/rb/confswap.svg)](http://badge.fury.io/rb/confswap)
:cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow: :cow2: :cow:

A simple command line tool to take a configuration file with template placeholders and replace those placeholders with environment variables.

The variables can come explicitly from the command, or read from a properties file.

## Usage

Configuration files come in different shapes and forms, confswap doesn't care if its toml or yaml

At the moment, you can run confswap in a few different ways.  By default it uses any environment varables that are available as it runs.

So, given the following template

```
# sample1.template
# Template to use environment variables
user=%{USER}
lang=%{LANG}
```

### Environment Variables

```confswap -t sample1.template sample.conf

will use the USER and LANG variables in your shell to populate the template.  You can use ``env`` to see your current environment variables.

additionally you can add additional variables to use, or overwrite extisting env variables during the running of the command via 

1. The envvar flag (which takes multiple variables which must be separated by an = sign

```confswap --envvar USER=something --envvar LANG=en_US.UTF-8 -t sample1.template sample2.conf 

2. explicit setting:

```USER=someoneelse LANG=en_IE.UTF-8 confswap -t sample1.template sample3.conf```

### Properties File

You can specify a property file containing keys and values such as
```
# sample.properties

USER: anotherone
```

Then read it using

```confswap -p sample.properties -t sample1.template sample3.conf```

You can also save templates as yaml files!

Pass in variables as you would normally then choose to make a yaml file config

```confswap -e test=giblets -e user=alsogiblets -e array='["1","3","4"]' --yaml your_conf.yaml```

1. Note array must be passed as a json string)
2. Also note that by default this will also save the environment variables currently saved in the shell, to ignore these, please use the ignore shell vars (-i) flag, i.e. 

```confswap -e test=giblets -e user=alsogiblets -e array='["1","3","4"]' --ignore-shell-vars --force --yaml your_conf.yaml```


should create a conf.yaml file with the environments

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
The point?

I had the need to procedurally create configuration files when automating the deployment of particular services.

Why not just use sed and replace in some kind of bash script?

I originally used this approach but the script grew unwieldy, maybe I don't do good bash or maybe its just because of lack of testing.  Whilst the benefit of a bash script is that it will run as-is on many systems, I find it better to treat a tool like this as software and therefore use the ecosystems already available to manage dependencies and deploy.  I also enjoy programming in ruby :)

## Tasks to do and improvement ideas

- ~~error message when config contains env variable that doesnt exist~~ Version 0.0.2
- ~~Read config from properties file~~ Version 0.0.4
- ~~verbose command~~ Version 0.0.5
- ~~YAML~~ Version 0.1.0

### Roadmap
- JSON Version 0.1.1
- improved logging 0.1.2

- improve verbose messages
- summary of what will change?  dry-run maybe?
- diff on what has changed in a config if overwriting?
- test command.rb

