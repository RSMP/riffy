
module Riffy

  # A Chunk has an id, a size cksize, and an array of bytes whose size is cksize

  class Chunk < BinData::Record
  
    endian :little
    
    string :id, length: 4
    uint32 :chunk_size
    array  :data, type: :uint8, initial_length: :chunk_size
    
  end
  
end
