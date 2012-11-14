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
  it "'セットリスト作成条件'というラベルが表示されている。" do
    rendered.should have_content("セットリスト作成条件")
  end

  it "'曲数'というラベルが表示されている。" do
    rendered.should have_content("曲数")
  end
  it "'曲数'セレクトボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("select", :name => "setlist[number_of_songs]")
    end
  end

  it "'ジョージ曲数'というラベルが表示されている。" do
    rendered.should have_content("ジョージ曲数")
  end
  it "'ジョージ曲数'セレクトボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("select", :name => "setlist[number_of_george]")
    end
  end

  it "'リンゴ曲数'というラベルが表示されている。" do
    rendered.should have_content("リンゴ曲数")
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
