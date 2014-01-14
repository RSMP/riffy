require_relative 'wav_fmt'

class ChunkData < Struct.new(:form_type, :chunks, :parent, :data)


  def initialize(file, parent)
  
    self.parent = parent
    self.chunks ||= []
    
    case self.parent.id
    when "RIFF"
    
      self.form_type = file.each_char.first(4).join
      
      until file.eof?
        
        self.chunks << Chunk.new(file)
        file.pos += self.chunks.last.size
        
      end
    
    when "fmt "
      temp_pos = file.pos
      
        self.data = WavFmt.new(file.each_char.first(16).join)
        
      file.pos = temp_pos
    else
    
      @file_position_of_data = file.pos
      
    end
  
  end
  
  def to_s
  
    
    print "\n  <#{self.form_type}>"
    self.chunks.each do |chunk|
        print "\n    <#{chunk.id}> <#{chunk.size}>"
    end;""
  
  end

end