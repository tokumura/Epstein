# coding: utf-8

Given /^セットリストに楽曲が１つ以上追加されている。$/ do
  @musics_johnpaul = Music.find_all_by_vocal('John&Paul')
  @musics_john = Music.find_all_by_vocal('John')
  @musics_paul = Music.find_all_by_vocal('Paul')
  @musics_george = Music.find_all_by_vocal('George')
  @musics_ringo = Music.find_all_by_vocal('Ringo')
  @musics_johnpaul.size.should > 0
  @musics_john.size.should > 0
  @musics_paul.size.should > 0
  @musics_george.size.should > 0
  @musics_ringo.size.should > 0
  visit(setlist_index_path)
  find('#music_list').click_link('Yesterday')
  find('#music_list').click_link('Girl')
  find('#setlist').find("#tr_2").should have_content('Yesterday')
  find('#setlist').find("#tr_3").should have_content('Girl')
end

When /^セットリスト内の楽曲の削除リンクをクリックした場合$/ do
  find('#tr_3').click_link('icon_3') # Remove 'Girl'
end

Then /^選択した楽曲がセットリストから削除される。$/ do
  find('#setlist').should have_content('Yesterday')
  find('#setlist').should_not have_content('Girl')
end
