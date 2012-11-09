# coding: utf-8
require 'spec_helper'

describe "mainmenu/index.html.erb" do
  before do
  end
  it "'EPSTEIN'というタイトルラベルが表示されている。" do
    render
    rendered.should have_content("EPSTEIN")
  end
  it "'セットリスト作成'というリンクボタンが表示されている。" do
    render
    rendered.should have_content("セットリスト作成")
  end
  it "'楽曲管理'というリンクボタンが表示されている。" do
    render
    rendered.should have_content("楽曲管理")
  end
end

