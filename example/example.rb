require_relative '../lib/riffy.rb'

filepath = "../bin/test.wav"
my_file = Riffy::RIFF.open(filepath)

##my_file.chunks.each do |chunk|
#  chunk = my_file.chunks[0]
#  
#  wave_fmt = Riffy::WavFmt.new
#  wave_fmt.read my_file.chunks[0].to_binary_s
#  
#  type = :"uint#{wave_fmt.bits_per_sample}le"
#  wave_data = BinData::Array.new(:type => type, :read_until => :eof)
#  #wave_data = Riffy::WavData.new(wave_fmt.bits_per_sample)
#  wave_data.read my_file.chunks[1].to_binary_s[7..-1]
#  
#  puts wave_fmt
#  
#  puts wave_fmt[:id]
#  
#  puts my_file.chunks[1].id
#  #puts wave_data.inspect
#  
##end
binding.pry
puts my_file
