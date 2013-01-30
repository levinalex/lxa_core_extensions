# LxaCoreExtensions


[![Build Status](https://travis-ci.org/levinalex/lxa_core_extensions.png)](https://travis-ci.org/levinalex/lxa_core_extensions)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/levinalex/lxa_core_extensions)

simple core extensions for ruby:

### Constants

    Infinity #=> Infinity
    NaN      #=> NaN

### Enumerable#build_hash

    [[1,2],[3,4],[5,6]].build_hash        #=> {1=>2, 3=>4, 5=>6}
    [[1,2],[3,4],[5,6]].build_hash(:last) #=> {2=>[1,2], 4=>[3,4], 6=>[5,6]}

### Hash#compact

    { 4=>35, 9=>nil, 10=>false }.compact   #=> {4=>35, 10=>false}

### Hash#rekey

    {1=>2, 3=>4, 5=>{6=>7, 8=>9}}.rekey(&:to_s)  #=> {"1"=>2,"3"=>4, "5"=>{"6"=>7, "8"=>9}}

### Hash#nested_keys

    {1=>{2=>3,4=>5}}.nested_keys.to_a   #=> [1,2,4]

### Hash#flip

    {1=>2, 3=>4, 5=>6, 6=>2, 7=>4}.flip  #=> {2=>[1, 6], 4=>[3, 7], 6=>[5]}

## Installation

    gem 'lxa_core_extensions'

