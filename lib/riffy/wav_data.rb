
module Riffy

  # A Chunk has an id, a size cksize, and an array of bytes whose size is cksize

  class WavData < BinData::Record
  
    def initialize(bps = 16)
      puts bps
      @bps = bps
    end
  
    endian :little
    
    string :id, length: 4, assert: "data"
    uint32 :chunk_size
    array  :data, type: :uint16, initial_length: lambda {chunk_size/2}
    
  end
  
end
