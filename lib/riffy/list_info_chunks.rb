
module Riffy

  class ListInfoArtist < BinData::Record
    string :artist, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoArchivalLocation < BinData::Record
    string :archival_location, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoCommissioner < BinData::Record
    string :commissioner, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoComments < BinData::Record
    string :comments, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoCopyright < BinData::Record
    string :copyright, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoCreatedAt < BinData::Record
    string :created_at, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoCropped < BinData::Record
    string :cropped, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoDimensions < BinData::Record
    string :dimensions, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoDpi < BinData::Record
    string :dpi, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoEngineer < BinData::Record
    string :engineer, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoGenre < BinData::Record
    string :genre, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoKeywords < BinData::Record
    string :keywords, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoLightness < BinData::Record
    string :lightness, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoMedium < BinData::Record
    string :medium, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoName < BinData::Record
    string :name, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoPalette < BinData::Record
    string :palette, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoProduct < BinData::Record
    string :product, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoSubject < BinData::Record
    string :subject, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoSoftware < BinData::Record
    string :software, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoSharpness < BinData::Record
    string :sharpness, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoSource < BinData::Record
    string :source, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoSourceForm < BinData::Record
    string :source_form, length: ->{ parent.padded_chunk_bytes }
  end
  class ListInfoTechnician < BinData::Record
    string :technician, length: ->{ parent.padded_chunk_bytes }
  end
  
end
