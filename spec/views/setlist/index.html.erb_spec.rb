# coding: utf-8
require 'spec_helper'

describe "setlist/index.html.erb" do

  fixtures :musics

  before do
    @musics = Music.all
    @setlist = Setlist.new
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
  it "'リンゴ曲数'セレクトボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("select", :name => "setlist[number_of_ringo]")
    end
  end

  it "'作成'というボタンが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "submit", :name => "btn-make")
    end
  end

end
