Given(/^I Sign Up or Log In with "([^"]*)"$/) do |provider|
  visit "/auth/#{provider.downcase}"
end

Given(/the following clubs exist/) do |clubs_table|
  clubs_table.hashes.each do |club|
    Club.create!(club)
  end
end

Given(/the following users exist/) do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end
  
Given (/the following authorizations exist/) do |authorizations_table|
  authorizations_table.hashes.each do |authorization|
    Authorization.create!(authorization) 
  end
end

Then(/(.*) seed clubs should exist/) do | n_seeds |
  Club.count.should be n_seeds.to_i
end

Then(/(.*) seed users should exist/) do | n_seeds |
  User.count.should be n_seeds.to_i
end

Then(/(.*) seed authorizations should exist/) do | n_seeds |
  Authorization.count.should be n_seeds.to_i
end

Given(/^I visit (.+)$/) do |page_name|
  visit path_to(page_name)
end

Then(/I should see "(.*)" before "(.*)"/) do |e1, e2|
  expect(/[\s\S]*#{e1}[\s\S]*#{e2}[\s\S]*/).to match(page.body) 
end

When(/I (un)?check the following subcategories: (.*)/) do |uncheck, subcategories_list|
  subcategories = subcategories_list.split(', ')
  subcategories.each do |subcategory|
    uncheck ? uncheck("subcategories[#{subcategory}]") : check("subcategories[#{subcategory}]")
  end
end

When(/I (un)?check all subcategories/) do |uncheck|
  subcategories = Club.all_categories.values.flatten
  subcategories.each do |subcategory|
    uncheck ? uncheck("subcategories[#{subcategory}]") : check("subcategories[#{subcategory}]")
  end
end

Given(/^I have an admin account$/) do 
  user = User.find(1)
  user.acct_type == "Admin"
end
