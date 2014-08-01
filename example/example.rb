require_relative '../lib/riffy.rb'

filepath = "../bin/test.wav"
file = File.open(filepath, "r")
riff = Riffy::Chunk.read(file)
puts riff.id
puts riff.data.form_type
#riff.chunks.each do |chunk|
#  puts chunk.id
#  puts chunk.chunk_size
#end
binding.pry