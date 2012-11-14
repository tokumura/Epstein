# coding: utf-8
Given /^遷移先に全楽曲リストがある。$/ do
  visit(musics_path)
end

When /^楽曲管理画面にアクセスした時、$/ do
  visit(musics_path)
end

Then /^「楽曲管理」というタイトルが表示される。$/ do
  page.should have_content('楽曲管理')
end

Then /^「タイトル」というテキストボックスが空欄で表示されている。$/ do
  page.should have_content('タイトル')
end

Then /^「ボーカル」というプルダウンリストが表示されている。$/ do
  page.should have_content('ボーカル')
end

Then /^「ソロ」というチェックボックスが表示されている。$/ do
  page.should have_content('ソロ')
end

Then /^「１曲目」というチェックボックスが表示されている。$/ do
  page.should have_content('１曲目')
end

Then /^「ラスト」というチェックボックスが表示されている。$/ do
  page.should have_content('ラスト')
end

Then /^「ピアノ」というチェックボックスが表示されている。$/ do
  page.should have_content('ピアノ')
end

Then /^「登録」ボタンが表示されている。$/ do
   click_on('登録')
end


Given /^楽曲登録フォームが入力されている。$/ do
  visit(musics_path)
  fill_in "music_title", :with => "Across the Universe"
end

When /^ユーザーが登録ボタンを押した時、$/ do
   click_on('登録')
end

Then /^登録された曲が、全曲リストの中に表示されている。$/ do
  find('#music_list').should have_content('Across the Universe')
end
