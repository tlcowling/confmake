confswap
========
:cow: :cow2: :cow: :cow2:

A simple command line tool to take a configuration file with template placeholders and replace those placeholders with environment variables.

It appears to be taking the shape of a ruby gem...

## Introduction

This is mostly for me to use as a convenience tool when creating docker containers.

When working with elasticsearch, I have used their system for using environment variables in the config, and this has worked very well for me especially when using ENV variables with docker run.

## Usage

Config files can use the `%{}` style to replace a token in a stirng with a variable

`export GIBLET_STATUS=active`
`export SPLENETIC_JUICE_FACTOR=10`

example.conf|.toml|.yaml`
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
