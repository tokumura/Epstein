# coding: utf-8

Given /^セットリストに楽曲が(\d+)曲以上追加されている。$/ do |arg1|
  @musics = Music.all
  @musics.size.should > arg1.to_i
  visit(setlist_index_path)
end

When /^セットリスト条件を'ALL:(\d+)', 'George:(\d+)', 'Ringo:(\d+)'として"(.*?)"ボタンをクリックした場合$/ do |arg1, arg2, arg3, arg4|
  @last_row = arg1.to_i + 1
  select arg1, :from => 'setlist[number_of_songs]'
  select arg2, :from => 'setlist[number_of_george]'
  select arg3, :from => 'setlist[number_of_ringo]'
  click_on(arg4)
end

Then /^セットリストの総曲数は(\d+)曲である。$/ do |arg1|
  find('#hdn_number_of_songs').should have_content(arg1)
end

Then /^ジョージの曲数は(\d+)曲である。$/ do |arg1|
  find('#hdn_number_of_george').should have_content(arg1)
end

Then /^リンゴの曲数は(\d+)曲である。$/ do |arg1|
  find('#hdn_number_of_ringo').should have_content(arg1)
end

Then /^最初の曲は、(\d+)曲目設定ONの曲である。$/ do |arg1|
  find(:xpath, "//input[@id='hdn_first_tr2']").value.should have_content('true')
end

Then /^最後の曲は、ラスト曲設定ONの曲である。$/ do
  find(:xpath, "//input[@id='hdn_last_tr" + @last_row.to_s + "']").value.should have_content('true')
end

When /^セットリスト条件は'ALL:(\d+)', 'George:(\d+)', 'Ringo:(\d+)'のままである。$/ do |arg1, arg2, arg3|
  find_field('setlist[number_of_songs]').value.should have_content(arg1)
  find_field('setlist[number_of_george]').value.should have_content(arg2)
  find_field('setlist[number_of_ringo]').value.should have_content(arg3)
end

