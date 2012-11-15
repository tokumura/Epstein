# coding: utf-8

Given /^セットリスト作成のページが存在する。$/ do
  visit(setlist_index_path)
end

When /^セットリスト作成のページにアクセスした場合$/ do
  visit(setlist_index_path)
end

Then /^セットリスト条件の項目が表示されている。$/ do
  page.should have_content('ALL')
  page.should have_content('George')
  page.should have_content('Ringo')
end

Then /^曲数のリストボックスが表示されている。$/ do
  select '10', :from => 'setlist[number_of_songs]'
end

Then /^ジョージ曲数のリストボックスが表示されている。$/ do
  select '10', :from => 'setlist[number_of_george]'
end

Then /^リンゴ曲数のリストボックスが表示されている。$/ do
  select '10', :from => 'setlist[number_of_ringo]'
end

Then /^'作成'ボタンが表示されている。$/ do
  click_on('作成')
end

