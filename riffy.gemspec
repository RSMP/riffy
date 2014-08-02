
Gem::Specification.new do |spec|

  spec.name = 'riffy'
  spec.version = '0.1.2'
  spec.date = '2014-01-14'
  spec.summary = 'RIFF file parser'
  spec.description = 'Converts RIFF files into Ruby objects'
  spec.authors = ["Dominic Muller"]
  spec.email = 'nicklink483@gmail.com'
  spec.files = [
    "bin/test.wav",
    "example/example.rb",
    "lib/riffy.rb",
    "riffy/chunk.rb",
    "riffy/riff.rb",
    "riffy/wav_data.rb",
    "riffy/wav_fmt.rb"
  ]
  spec.homepage = 'https://github.com/nicklink483/riffy'
  spec.license = 'MIT'
  
end
