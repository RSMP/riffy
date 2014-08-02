require 'spec_helper'

describe Riffy::Chunk do

  it "should have an id"
  it "should have a size in bytes"
  
  context "when it's a RIFF chunk" do
    it "should have an id of RIFF"
    it "should have a form type"
  end
  
  context "when it's a LIST chunk" do
    it "should have an id of LIST"
    it "should have a form type"
  end
  
end
