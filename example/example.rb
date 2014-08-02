require_relative '../lib/riffy.rb'

filepath = "../bin/test.wav"
#filepath = "../bin/fairyfountain.wav"
#filepath = "../bin/sample.avi"
#filepath = "../bin/startrek.avi"
file = File.open(filepath, "r")
riff = Riffy::Chunk.read(file)
puts riff.id
puts riff.data.form_type
#data_location = riff.data_location
wave_data = riff.wave_data
#puts "compression code: " + wave_data.compression_code.to_s
#puts "channels: " + wave_data.channels.to_s
#puts "sample rate: " + wave_data.sample_rate.to_s
binding.pry
#puts riff.data.chunks[1]