
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
      struct "RIFF" do
        string :form_type, length: 4
        array :chunks, type: :chunk, read_until: :eoc
      end
      struct "LIST" do
        string :form_type, length: 4
        array :chunks, type: :chunk, read_until: :eoc
      end
      
      # supported WAVE subchunks
      wav_fmt "fmt "
      #wav_fact "fact"
      #wav_slnt "slnt"
      #wav_cue "cue "
      #wav_plst "plst"
      #wav_list "list"
      #wav_labl "labl"
      #wav_note "note"
      #wav_ltxt "ltxt"
      #wav_smpl "smpl"
      #wav_inst "inst"
      
      array :default,
        type: :uint8,
        initial_length: :padded_chunks
    end
    
    def eoc
      # eoc means "end of chunks"
      data.num_bytes == padded_chunks
    end
    
    def padded_chunks
      chunk_size.odd? ? chunk_size+1 : chunk_size
    end
    
  end
  
end
