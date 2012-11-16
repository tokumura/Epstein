# coding: utf-8
require 'spec_helper'

describe Setlist do
  fixtures :musics
  context "曲数が10曲, ジョージが3曲, リンゴが2曲の場合" do
    before do
      conditions = {:number_of_songs => '10', :number_of_george => '3', :number_of_ringo => '2'}
      @setlist = Setlist.new
      @setlist = @setlist.set_conditions(conditions)
    end
    it "曲数は10に設定される。" do
      @setlist.number_of_songs.should == "10"
    end
    it "ジョージは3曲に設定される。" do
      @setlist.number_of_george.should == "3"
    end
    it "リンゴは2曲に設定される。" do
      @setlist.number_of_ringo.should == "2"
    end
  end

  context "曲数が10曲, ジョージが3曲, リンゴが2曲でシャッフルした場合" do
    before do
      conditions = {:number_of_songs => '10', :number_of_george => '3', :number_of_ringo => '2'}
      @setlist = Setlist.new
      @setlist = @setlist.set_conditions(conditions)
      @setlist_shuffled = @setlist.shuffle(@setlist)
    end
    it "セットリストの曲数は10に設定される。" do
      @setlist_shuffled.size == 10
    end
    it "セットリストに含まれるジョージ曲数は3曲に設定される。" do
      number_of_george = 0
      @setlist_shuffled.each do |music|
        if music.vocal == "George"
          number_of_george = number_of_george + 1
        end
      end
      number_of_george.should == 3
    end
    it "セットリストに含まれるリンゴの曲数は2曲に設定される。" do
      number_of_ringo = 0
      @setlist_shuffled.each do |music|
        if music.vocal == "Ringo"
          number_of_ringo = number_of_ringo + 1
        end
      end
      number_of_ringo.should == 2
    end
    it "セットリストに含まれるジョージ、リンゴ以外の曲数は5曲に設定される。" do
      number_of_other = 0
      @setlist_shuffled.each do |music|
        if music.vocal != "George" && music.vocal != "Ringo"
          number_of_other = number_of_other + 1
        end
      end
      number_of_other.should == 5
    end
=begin
=end
  end
end

