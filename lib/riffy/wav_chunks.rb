module Riffy

  class WavFmt < BinData::Record
      
    endian :little
    
    # Byte Number 	Size 	Description 	     Value
    # 0-3 	         4 	  Chunk ID 	         "fmt " (0x666D7420)
    # 4-7 	         4 	  Chunk Data Size 	 Length Of format Chunk (always 0x10 (16))
    # 8-9          	 2 	  Compression code 	 Always 0x01
    # 10 - 11 	     2 	  Channel Number  	 0x01=Mono, 0x02=Stereo
    # 12 - 15 	     4 	  Sample Rate 	     Binary, in Hz
    # 16 - 19 	     4 	  Bytes Per Second
    # 20 - 21 	     2 	  Bytes Per Sample 	 1=8 bit Mono, 2=8 bit Stereo or 16 bit Mono, 4=16 bit Stereo
    # 22 - 23 	     2 	  Bits Per Sample 	 
    
    uint16 :compression_code, assert: 1
    uint16 :channels
    uint32 :sample_rate
    uint32 :byte_rate
    uint16 :bytes_per_sample
    uint16 :bits_per_sample
    
  end

  class WavFact < BinData::Record
      
    endian :little
    uint32 :data
    
  end
    
end