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

  it "'楽曲管理'というタイトルが表示されている。" do
    rendered.should have_content("楽曲管理")
  end

  it "'タイトル'というラベルが表示されている。" do
    rendered.should have_content("タイトル")
  end
  it "'タイトル'エディットボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "text", :name => "music[title]")
    end
  end

  it "'ボーカル'というラベルが表示されている。" do
    rendered.should have_content("ボーカル")
  end
  it "'ボーカル'ドロップダウンリストが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("select", :name => "music[vocal]")
    end
  end

  it "'ソロ'というラベルが表示されている。" do
    rendered.should have_content("ソロ")
  end
  it "'ソロ'チェックボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "checkbox", :name => "music[solo]")
    end
  end

  it "'１曲目'というラベルが表示されている。" do
    rendered.should have_content("１曲目")
  end
  it "'１曲目'チェックボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "checkbox", :name => "music[first]")
    end
  end

  it "'ラスト'というラベルが表示されている。" do
    rendered.should have_content("ラスト")
  end
  it "'ラスト'チェックボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "checkbox", :name => "music[last]")
    end
  end

  it "'ピアノ'というラベルが表示されている。" do
    rendered.should have_content("ピアノ")
  end
  it "'ピアノ'チェックボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "checkbox", :name => "music[piano]")
    end
  end

  it "'登録ボタンが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "submit", :name => "regist", :value => '登録')
    end
  end
end
