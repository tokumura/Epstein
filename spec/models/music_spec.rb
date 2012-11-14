require 'spec_helper'

describe Music do
  before(:each) do
    @music = Music.new(:title => "Across the Universe", :vocal => "John")
  end


  it "is valid with valid attributes" do
    @music.should be_valid
  end

  it "is not valid without title" do
    @music.title = nil
    @music.should_not be_valid
  end

  it "is not valid without vocal" do
    @music.vocal = nil
    @music.should_not be_valid
  end
end
