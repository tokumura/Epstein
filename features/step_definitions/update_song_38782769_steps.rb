# coding: utf-8


Given /^編集したい楽曲が楽曲リストに登録されている。$/ do
  visit(musics_path)
  find('#music_list').should have_content('You Know My Name')
end

When /^ユーザーが楽曲リンクをクリックする、$/ do
  page.click_link('You Know My Name')
end

Then /^編集フォームにクリックした楽曲情報が表示される。$/ do
  find_field('music[title]').value.should have_content('You Know My Name')
  find_field('music[vocal]').value.should have_content('John&Paul')
end

Then /^楽曲情報を変更して、登録ボタンを押すと、$/ do
  fill_in 'music[title]', :with => 'You Know My Game'
  select('John', :form => 'music[vocal]')
  click_on('登録')
end

Then /^楽曲情報が更新され、フォームは空になる。$/ do
  find_field('music[title]').value.should_not have_content('You Know My')
  find_field('music[vocal]').value.should have_content('John')
  find('#music_list').should_not have_content('You Know My Name')
  page.click_link('You Know My Game')
end

