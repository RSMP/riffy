require_relative 'chunk'

class Riffy < Chunk

  attr_reader :type
  
  def initialize(file)
  
    begin
      raise "File corrupt or unreadable." unless Riffy.verify(file)
    rescue
      
    end
      
    self.id = FourCC.new('RIFF')
    super(file)
    
  end
  
  def format #return the format of the RIFF file. e.g. "WAVE"
  
    self.data.form_type
  
  end
  
  def bit_rate
    self.data.chunks[0].data.data.bit_rate
  end
  

  
  def self.open(file)
  
    begin
      f = File.open(file, "rb")
    rescue
      puts "The file failed to load for some reason."
    end
    
    Riffy.new(f)
    
  end
  
  private
  
  def self.parse_riff(file)
  
    # parse file by creating chunk objects etc.
    f = File.open(file)
    
    attr_array = []
    
    
    
    self.id = f.each_char.first(4).join
    self.size = f.each_char.first(4).join.unpack("L<")[0]
    
    puts self.id
    puts self.size
    
    self.data = ChunkData.new(f, :riff)
    
    # @type = file[8..11]
  
  end
  
  def self.verify(file)
    
    return true
  end

end