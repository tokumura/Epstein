# coding: utf-8
require 'spec_helper'

describe "musics/index.html.erb" do

  fixtures :musics

  before do
    @musics = Music.all
    @music = Music.new
    render
  end

  it "タイトルに'曲リスト'が表示されている。" do
    rendered.should have_content("Blue Jay Way")
  end

  it "楽曲リスト内に全曲表示されている。" do
    @musics.each do |music|
      rendered.should have_content(music.title)
    end
  end

end
