
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

    choice :data, selection: :id do
      riff_data "RIFF"
      wav_fmt "fmt "
      array :default,
        type: :uint8,
        initial_length: -> {chunk_size.odd? ? chunk_size+1 : chunk_size}
    end
    
  end
  
end
