# coding: utf-8

Given /^楽曲が登録されていること。$/ do
  @musics = Music.all 
end

When /^楽曲管理画面が表示された時、$/ do
  visit musics_path
end

Then /^Blue Jay Wayが表示されている。$/ do
  page.should have_content('Blue Jay Way')
end

