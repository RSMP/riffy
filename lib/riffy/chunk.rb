
module Riffy

  # A Chunk has an id, a size cksize, and an array of bytes whose size is cksize

  # typedef unsigned long DWORD;
  # typedef unsigned char BYTE;
  # 
  # typedef DWORD FOURCC;       // Four-character code
  # 
  # typedef FOURCC CKID;        // Four-character-code chunk identifier
  # typedef DWORD CKSIZE;       // 32-bit unsigned size value
  # 
  # typedef struct {            // Chunk structure
  #   CKID ckID;                // Chunk type identifier
  #   CKSIZE ckSize;            // Chunk size field (size of ckData)
  #   BYTE ckData[ckSize];      // Chunk data
  # } CK;
  
  class Chunk < BinData::Record
  
    endian :little
    
    string :id, length: 4
    uint32 :chunk_size
    array  :data, type: :uint8, length: -> {chunk_size.odd? ? chunk_size+1 : chunk_size}, onlyif: :cant_have_chunks
    array  :chunks, type: :chunk, initial_length: 2, onlyif: :can_have_chunks
    
    def can_have_chunks
      #binding.pry
      id.eql? "RIFF"
    end
    
    def cant_have_chunks
      #binding.pry
      !id.eql?("RIFF")
    end
  end
  
end
