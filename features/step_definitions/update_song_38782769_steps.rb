# coding: utf-8


Given /^編集したい楽曲が楽曲リストに登録されている。$/ do
  visit(musics_path)
  find('#music_list').should have_content('You Know My Name')
end

When /^ユーザーが楽曲リンクをクリックする、$/ do
  page.click_link('You Know My Name')
end

Then /^編集フォームにクリックした楽曲情報が表示される。$/ do
  pending
end

Then /^楽曲情報を変更して、更新ボタンを押すと、$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^楽曲情報が更新され、フォームは空になる。$/ do
  pending # express the regexp above with the code you wish you had
end

