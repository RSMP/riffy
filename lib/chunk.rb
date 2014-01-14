require_relative 'four_cc'
require_relative 'chunk_data'

class Chunk < Struct.new(:id, :size, :data)

  # MIN_SIZE = "\x00\x00\x00\x00".unpack("L<")
  # MAX_SIZE = "\xFF\xFF\xFF\xFF".unpack("L<")
  
  def initialize(file)
  
    self.id = file.each_char.first(4).join
    self.size = file.each_char.first(4).join.unpack("L<")[0]
    self.data = ChunkData.new(file, self)
  
  end
  
  def to_s
  
    print "\n\t\"#{self.id}\" <#{self.size}> (\n"
    print "\t  \"#{self.data.form_type}\",\n"
    comma_count = self.data.chunks.length - 1
    self.data.chunks.each do |chunk|
    
      #if chunk.id.eql? "fmt "
        print "\t  < \"#{chunk.id}\" <#{chunk.size}> "
          chunk.data.chunks.each do |sub_chunk|
            print "< \"#{sub_chunk.id}\" <#{sub_chunk.size}> >"
          end
        #print "\n"
        case chunk.id
        when "fmt "
          print chunk.data.data.to_s
        when "LIST"
        end
        print "\t >"
        if comma_count > 0
          print ",\n"
        else
          print "\n"
        end
        comma_count -= 1

      # else
      
        # print "\t  < \"#{chunk.id}\" <#{chunk.size}> "
          # chunk.data.chunks.each do |sub_chunk|
            # print "< \"#{sub_chunk.id}\" <#{sub_chunk.size}> >"
          # end
        # print " >"
        # if comma_count > 0
          # print ",\n"
        # else
          # print "\n"
        # end
        # comma_count -= 1
      
      # end
    end
    print "\t)\n"
  
  end
  
end