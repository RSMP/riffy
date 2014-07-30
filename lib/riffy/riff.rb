
module Riffy

  # RIFF type has a FormType with dependent subchunks, e.g. 'WAVE' has 'fmt ' and 'data'
  # Thanks to bnagy for turning me onto the bindata gem
  # I should be able to define bindata primitives which work together to cogently
  #   parse any RIFF files
  
  class RIFF < BinData::Record
  
    endian :little
    
    string :id, length: 4
    uint32 :file_size
    string :form_type, length: 4
    array  :chunks, type: :chunk, initial_length: 2
    
    def to_s
      output = "\n"
      output += "  id: " + id.to_s + "\n"
      output += "  file size: " + file_size.to_s + "\n"
      output += "  form type: " + form_type.to_s + "\n"
      chunks.each do |chunk|
        output += "    id: " + chunk.id.to_s + "\n"
        output += "    size: " + chunk.chunk_size.to_s + "\n"
      end
      output
    end
    
    def self.open(filepath)
      
      file = File.open(File.expand_path(filepath), "r")
      riff = self.new
      riff.read file
      
    end
    
  end
  
end
