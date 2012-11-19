# coding: utf-8

Given /^セットリストに楽曲が(\d+)曲以上追加されている。$/ do |arg1|
  @musics = Music.all
  @musics.size.should > 10
  visit(setlist_index_path)
end

When /^セットリスト条件を'ALL:(\d+)', 'George:(\d+)', 'Ringo:(\d+)'として"(.*?)"ボタンをクリックした場合$/ do |arg1, arg2, arg3, arg4|
  select '15', :from => 'setlist[number_of_songs]'
  select '3', :from => 'setlist[number_of_george]'
  select '2', :from => 'setlist[number_of_ringo]'
  click_on('作成')
end

Then /^セットリストの総曲数は(\d+)曲である。$/ do |arg1|
  find('#hdn_number_of_songs').should have_content('15')
end

Then /^ジョージの曲数は(\d+)曲である。$/ do |arg1|
  find('#hdn_number_of_george').should have_content('3')
end

Then /^リンゴの曲数は(\d+)曲である。$/ do |arg1|
  find('#hdn_number_of_ringo').should have_content('2')
end

When /^セットリスト条件は'ALL:(\d+)', 'George:(\d+)', 'Ringo:(\d+)'のままである。$/ do |arg1, arg2, arg3|
  find_field('setlist[number_of_songs]').value.should have_content('15')
  find_field('setlist[number_of_george]').value.should have_content('3')
  find_field('setlist[number_of_ringo]').value.should have_content('2')
end

