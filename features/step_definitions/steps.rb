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

Then(/(.*) seed users should exist/) do | n_seeds |
  User.count.should be n_seeds.to_i
end

Given(/^I visit (.+)$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should see message "Welcome (back )?([^!]*)! You have (signed up|logged in) via ([^\.]*)."$/) do |back, name, sorl, provider|
  step %Q{I should see "Welcome #{back}#{name}! You have #{sorl} via #{provider}."}
end

Then(/^I should see error message "([^"]*)"$/) do |message|
  step %Q{I should see "#{message}"}
end

