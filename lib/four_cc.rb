class FourCC < Struct.new(:value)

  # A FOURCC is represented as a sequence of one to four
  # ASCII alphanumeric characters, padded on the right with
  # blank characters (ASCII character value 32) as
  # required, with no embedded blanks (i.e. "H DL" invalid).

  def initialize(value="    ")
  
    begin
      raise "FourCC invalid." unless FourCC.verify(value)
      self.value = value
    rescue
    
    end
  
  end
  
  def to_s
    self.value
  end
  
  private
  
  def self.verify(value)
  
    valid = true
    
    return false unless valid
    return true
    
  end
  
end