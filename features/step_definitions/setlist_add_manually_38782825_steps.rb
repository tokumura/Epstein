# coding: utf-8

Given /^楽曲が登録されている。$/ do
  @musics = Music.all
  @musics.size.should > 0
  visit setlist_index_path
end

When /^楽曲リンクをクリックした場合$/ do
  find('#music_list').click_link('Yesterday')
end

Then /^選択した楽曲がセットリストに追加される。$/ do
  find('#setlist').should have_content('Yesterday')
end

