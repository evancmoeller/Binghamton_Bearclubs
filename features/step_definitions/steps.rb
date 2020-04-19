When("I log in with GitHub") do
  visit "/auth/github/callback"
end

When("I log in with Facebook") do
  visit "/auth/facebook/callback"
end

Given (/the following users exist/) do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Then (/(.*) seed users should exist/) do | n_seeds |
  User.count.should be n_seeds.to_i
end