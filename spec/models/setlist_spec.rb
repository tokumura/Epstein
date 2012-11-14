# coding: utf-8
require 'spec_helper'

describe Setlist do
  context "曲数が10曲, ジョージが3曲, リンゴが2曲の場合" do
    before do
      conditions = {:number_of_songs => '10', :number_of_george => '3', :number_of_ringo => '2'}
      @setlist = Setlist.new
      @setlist = @setlist.set_conditions(conditions)
    end
    it "曲数は10に設定される。" do
      @setlist.number_of_songs.should == 10
    end
    it "ジョージは3曲に設定される。" do
      @setlist.number_of_george.should == 3
    end
    it "リンゴは2曲に設定される。" do
      @setlist.number_of_ringo.should == 2
    end
  end
end

