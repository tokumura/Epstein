# coding: utf-8

Given /^遷移先にセットリスト作成と楽曲管理がある。$/ do
  visit musics_path
  visit setlist_index_path
end

When /^メインメニュー画面が表示された時、$/ do
  visit mainmenu_index_path
end

Then /^Epsteinというタイトルが表示される。$/ do
  page.should have_content('EPSTEIN')
end

Then /^セットリスト作成 と 楽曲管理 の２つのリンクが表示される。$/ do
  page.should have_content('セットリスト作成')
  click_link('セットリスト作成')
  page.should have_content('楽曲管理')
  click_link('楽曲管理')
end

