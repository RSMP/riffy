riffy
=====

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
