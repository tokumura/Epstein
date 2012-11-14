# coding: utf-8

Given /^セットリストに楽曲が１つ以上追加されている。$/ do
  @musics = Music.all
  @musics.size.should > 0
  visit(setlist_index_path)
  find('#music_list').click_link('Yesterday')
  find('#music_list').click_link('Girl')
  find('#setlist').find("#tr_2").should have_content('Yesterday')
  find('#setlist').find("#tr_3").should have_content('Girl')
end

When /^セットリスト内の楽曲の削除リンクをクリックした場合$/ do
  find('#tr_3').click_link('Delete') # Remove 'Girl'
end

Then /^選択した楽曲がセットリストから削除される。$/ do
  find('#setlist').should have_content('Yesterday')
  find('#setlist').should_not have_content('Girl')
end
