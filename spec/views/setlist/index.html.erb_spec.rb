# coding: utf-8
require 'spec_helper'

describe "setlist/index.html.erb" do
  before do
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
      form.should have_selector("select", :name => "number_of_song")
    end
  end

  it "'ジョージ曲数'というラベルが表示されている。" do
    rendered.should have_content("ジョージ曲数")
  end
  it "'ジョージ曲数'セレクトボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("select", :name => "number_of_george")
    end
  end

  it "'リンゴ曲数'というラベルが表示されている。" do
    rendered.should have_content("リンゴ曲数")
  end
  it "'ジョージ曲数'セレクトボックスが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("select", :name => "number_of_ringo")
    end
  end

  it "'作成'というボタンが表示されている。" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "button", :name => "make")
    end
  end
end
