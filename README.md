[![Tests](https://github.com/mlibrary/pairtree/actions/workflows/tests.yml/badge.svg)](https://github.com/mlibrary/pairtree/actions/workflows/tests.yml)
[![Coverage Status](https://coveralls.io/repos/github/mlibrary/pairtree/badge.svg?branch=main)](https://coveralls.io/github/mlibrary/pairtree?branch=main)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

# pairtree

Ruby implementation of the [Pairtree](https://www.ietf.org/archive/id/draft-kunze-pairtree-01.txt) specification from the California Digital Library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pairtree'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pairtree

## Usage

```ruby
  require 'pairtree'

  # Initiate a tree
  pairtree = Pairtree.at('./data', :prefix => 'pfx:', :create => true)
  
  # Create a ppath
  obj = pairtree.mk('pfx:abc123def')
  
  # Access an existing ppath
  obj = pairtree['pfx:abc123def']
  obj = pairtree.get('pfx:abc123def')
  
  # ppaths are Dir instances with some File and Dir class methods mixed in
  obj.read('content.xml')
  => "<content/>"
  obj.open('my_file.txt','w') { |io| io.write("Write text to file") }
  obj.entries
  => ["content.xml","my_file.txt"]
  obj['*.xml']
  => ["content.xml"]
  obj.each { |file| ... }
  obj.unlink('my_file.txt')
  
  # Delete a ppath and all its contents
  pairtree.purge!('pfx:abc123def')
```

##  Copyright

Copyright (c) 2010 Chris Beer. See LICENSE.txt for further details.
