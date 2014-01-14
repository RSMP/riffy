class WavFmt

  attr_reader :bit_rate
  
  def initialize(data)
  
    # Byte Number 	Size 	Description 	     Value
    # 0-3 	         4 	  Chunk ID 	         "fmt " (0x666D7420)
    #@chunk_id = data[0..3]
    # 4-7 	         4 	  Chunk Data Size 	 Length Of format Chunk (always 0x10)
    #@chunk_size = data[4..7]
    # 8-9          	 2 	  Compression code 	 Always 0x01
    #puts data
    @compression_code = data[0..1].unpack("C")[0]
    # 10 - 11 	     2 	  Channel Numbers 	 0x01=Mono, 0x02=Stereo
    #puts data[2..3].inspect
    @channels = data[2..3].unpack("C")[0]
    # 12 - 15 	     4 	  Sample Rate 	     Binary, in Hz
    @sample_rate = data[4..7].unpack("L")[0]/1000
    # 16 - 19 	     4 	  Bytes Per Second 	 
    @kbps = data[8..11].unpack("L")[0]/1000*8
    @bit_rate = @kbps
    # 20 - 21 	     2 	  Bytes Per Sample 	 1=8 bit Mono, 2=8 bit Stereo or 16 bit Mono, 4=16 bit Stereo
    @bytes_per_sample = data[12..13].unpack("C")[0]
    # 22 - 23 	     2 	  Bits Per Sample 	 
    @bits_per_sample = data[14..15].unpack("C")[0]
    
  end

  def to_s
  
    puts "\n\tcompression_code: #{@compression_code}"
    puts "\t        channels: #{(@channels == 1) ? "Mono" : "Stereo"}"
    puts "\t     Sample Rate: #{@sample_rate} kHz"
    puts "\t        Bit Rate: #{@kbps} kbps"
    puts "\tbytes_per_sample: #{@bytes_per_sample}"
    print "\t bits_per_sample: #{@bits_per_sample}"
  
  end


end