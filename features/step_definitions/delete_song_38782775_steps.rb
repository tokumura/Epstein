# coding: utf-8


Given /^楽曲が楽曲リストに登録されている。$/ do
  visit(musics_path)
  find('#music_list').should have_content('You Know My Name')
end

When /^ユーザーが削除リンクをクリックし、確認ダイアログでOKを押した時、$/ do
  find('#tr_290').click_link('削除')
  page.execute_script 'window.confirm = function() { return true }'
end

Then /^全曲リストの中から削除される。$/ do
  find('#music_list').should_not have_content('You Know My Name')
end

