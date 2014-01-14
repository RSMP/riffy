riffy
=====

A RIFF file format parser Ruby gem

gem install riffy

Try it out!

require 'riffy'

file = Riffy.open("bin/test.wav")

puts file.to_s

        "RIFF" <104484> (
          "WAVE",
          < "fmt " <16>
        compression_code: 1
                channels: Mono
             Sample Rate: 48 kHz
                Bit Rate: 768 kbps
        bytes_per_sample: 2
         bits_per_sample: 16     >,
          < "data" <104448>      >
        )
        
puts file.format

WAVE
