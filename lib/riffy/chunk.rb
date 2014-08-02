
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
        choice :chunks, selection: :form_type do
          skip "movi", length: ->{padded_chunk_bytes-4}
          array :default, type: :chunk, read_until: :eoc
        end
      end
      
      #supported LIST subchunks
      list_info_archival_location "IARL"
      list_info_artist "IART"
      list_info_commissioner "ICMS"
      list_info_comments "ICMT"
      list_info_copyright "ICOP"
      list_info_created_at "ICRD"
      list_info_cropped "ICRP"
      list_info_dimensions "IDIM"
      list_info_dpi "IDPI"
      list_info_engineer "IENG"
      list_info_genre "IGNR"
      list_info_keywords "IKEY"
      list_info_lightness "ILGT"
      list_info_medium "IMED"
      list_info_name "INAM"
      list_info_palette "IPLT"
      list_info_product "IPRD"
      list_info_subject "ISBJ"
      list_info_software "ISFT"
      list_info_sharpness "ISHP"
      list_info_source "ISRC"
      list_info_source_form "ISRF"
      list_info_technician "ITCH"
      
      # supported WAVE subchunks
      wav_fmt  "fmt "
      wav_fact "fact"
      wav_slnt "slnt"
      wav_cue  "cue "
      wav_plst "plst"
      wav_list "list"
      wav_labl "labl"
      wav_note "note"
      wav_ltxt "ltxt"
      wav_smpl "smpl"
      wav_inst "inst"
      #wav_data "data"
      
      #supported AVI subchunks
      
      avi_avih "avih"
      avi_strh "strh"
      #avi_strf "strf"
      
      skip :default,
        #type: :uint8,
        length: ->{padded_chunk_bytes}
        #initial_length: :padded_chunk_bytes
    end
    
    def eoc
      # eoc means "end of chunks"
      #binding.pry unless (data.form_type.eql? "movi" data.chunks.size % 100 == 0)
      #binding.pry
      data.num_bytes == padded_chunk_bytes
    end
    
    def padded_chunk_bytes
      chunk_size.odd? ? chunk_size+1 : chunk_size
    end
    
    def data_location
      data.chunks.select {|chunk| chunk.id.eql? "data"}[0].data.abs_offset
    end
    
    def wave_data
      if is_wave?
        data.chunks.select {|chunk| chunk.id.eql? "fmt "}[0].data
      else
        puts "File is not proper format"
      end
    end
    
    def movi?
      form_type.eql? "movi"
    end
    
    def not_movi?
      !movi?
    end
    
    def form_type
      if (id.eql?("RIFF") || id.eql?("LIST"))
        data.form_type
      end
    end
    
    def is_wave?
      form_type.eql? "WAVE"
    end
    
  end
  
end
