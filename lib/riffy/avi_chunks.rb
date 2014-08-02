
module Riffy

  class Rect < BinData::Record
    endian :little
    uint16 :left
    uint16 :top
    uint16 :right
    uint16 :bottom
  end

  class AviAvih < BinData::Record
  
    endian :little
    uint32 :frame_rate
    uint32 :transfer_rate
    uint32 :padding_gran
    uint32 :flags
    uint32 :frames
    uint32 :initial_frames
    uint32 :streams
    uint32 :buffer_size
    uint32 :width
    uint32 :height
    array :reserved, type: :uint32, initial_length: 4
    
  end
  
  class AviStrh < BinData::Record
  
    endian :little
    string :type, length: 4
    string :handler, length: 4
    uint32 :flags
    uint16 :priority
    uint16 :language
    uint32 :initial_frames
    uint32 :scale
    uint32 :rate
    uint32 :start
    uint32 :duration
    uint32 :buffer_size
    uint32 :quality
    uint32 :sample_size
    rect :frame
    
  end
  
end
