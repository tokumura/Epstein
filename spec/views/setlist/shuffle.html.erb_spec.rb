# coding: utf-8
require 'spec_helper'

describe "setlist/shuffle.html.erb" do

  fixtures :musics

  before do
    @musics_johnpaul = Music.find_all_by_vocal('John&Paul')
    @musics_john = Music.find_all_by_vocal('John')
    @musics_paul = Music.find_all_by_vocal('Paul')
    @musics_george = Music.find_all_by_vocal('George')
    @musics_ringo = Music.find_all_by_vocal('Ringo')
    @setlist = Setlist.new
    @setlist_shuffled = Array.new
    params = Array.new
    conditions = {:number_of_songs => '10', :number_of_george => '3', :number_of_ringo => '2' }
    @setlist = @setlist.set_conditions(conditions)
    @setlist_shuffled = @setlist.shuffle(@setlist)
    render
  end

  it "'セットリスト'というタイトルラベルが表示されている。" do
    rendered.should have_content("セットリスト")
  end

  it "'ALL'というラベルが表示されている。" do
    rendered.should have_content("ALL")
  end
  it "'ALL'セレクトボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("select", :name => "setlist[number_of_songs]")
    end
  end

  it "'George'というラベルが表示されている。" do
    rendered.should have_content("George")
  end
  it "'George'セレクトボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("select", :name => "setlist[number_of_george]")
    end
  end

  it "'Ringo'というラベルが表示されている。" do
    rendered.should have_content("Ringo")
  end
  it "'Ringo'セレクトボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("select", :name => "setlist[number_of_ringo]")
    end
  end

  it "'作成'というボタンが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "submit", :name => "btn-shuffle")
    end
  end

  it "最初の曲は一曲目設定ONの曲が表示されている。" do
    @setlist_shuffled[0].first.should == true
  end

  it "最後の曲はラスト曲設定ONの曲が表示されている。" do
    @setlist_shuffled[@setlist_shuffled.size - 1].last.should == true
  end
end
