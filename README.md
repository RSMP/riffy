riffy
=====
[![Gem Version](https://badge.fury.io/rb/riffy.svg)](http://badge.fury.io/rb/riffy)
[![Build Status](https://travis-ci.org/RSMP/riffy.svg?branch=master)](https://travis-ci.org/RSMP/riffy)
[![Coverage Status](https://coveralls.io/repos/RSMP/riffy/badge.png)](https://coveralls.io/r/RSMP/riffy)
[![Dependency Status](https://gemnasium.com/RSMP/riffy.svg)](https://gemnasium.com/RSMP/riffy)
[![Code Climate](https://codeclimate.com/github/RSMP/riffy/badges/gpa.svg)](https://codeclimate.com/github/RSMP/riffy)

A RIFF file format parser Ruby gem

    gem install riffy

Try it out!

    require 'riffy'
    => true
    file = Riffy::RIFF.open("bin/test.wav")
    puts file.to_s

      id: RIFF
      file size: 104484
      form type: WAVE
        id: fmt
        size: 16
        id: data
        size: 104448

    =>nil
    puts "You have a #{file.format} file!"
    You have a WAVE file!
    => nil
