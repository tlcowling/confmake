confswap
========

A simple command line tool to load a configuration file template and fill placeholders with environment variables.

## Introduction

This is mostly as a convenience tool for me when creating docker containers, to pass in environment variables.  Its the same
philosophy as the elasticsearch config which uses {{VARIABLE}} as a means by which to manage configs whose contents vary 
depending on environments / how you create the container.
