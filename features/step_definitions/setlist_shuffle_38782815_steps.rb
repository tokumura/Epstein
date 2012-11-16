# coding: utf-8

Given /^セットリストに楽曲が(\d+)曲以上追加されている。$/ do |arg1|
  @musics = Music.all
  @musics.size.should > 10
  visit(setlist_index_path)
end

When /^セットリスト条件を'ALL:(\d+)', 'George:(\d+)', 'Ringo:(\d+)'として"(.*?)"ボタンをクリックした場合$/ do |arg1, arg2, arg3, arg4|
  select '10', :from => 'setlist[number_of_songs]'
  select '3', :from => 'setlist[number_of_george]'
  select '2', :from => 'setlist[number_of_ringo]'
  click_on('作成')
end

Then /^セットリストの総曲数は(\d+)曲である。$/ do |arg1|
  find('#hdn_number_of_songs').should have_content('10')
end

Then /^ジョージの曲数は(\d+)曲である。$/ do |arg1|
  find('#hdn_number_of_george').should have_content('3')
end

Then /^リンゴの曲数は(\d+)曲である。$/ do |arg1|
  find('#hdn_number_of_ringo').should have_content('2')
end

