# coding: utf-8

Given /^楽曲が登録されている。$/ do
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
  visit setlist_index_path
end

When /^楽曲リンクをクリックした場合$/ do
  find('#music_list').click_link('Yesterday')
  page.execute_script 'window.confirm = function () { return true }'
end

Then /^選択した楽曲がセットリストに追加される。$/ do
  find('#setlist').should have_content('Yesterday')
end

