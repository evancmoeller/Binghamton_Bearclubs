Feature: 3rd party authenticated log in

Background: user have been added to database and on the starting page
  
  Given the following users exist:
  | name           | email                   |
  | Baxter Bearcat | bbearcat@binghamton.edu |
  
  Then 1 seed users should exist
  And I am on the Binghamton Bearclub's "Welcome Page"
  
  

Scenario: log in with GitHub
  When I log in with GitHub
  # Then I am on the Binghamton Bearclub's "Dashboard Page"
  # And I should see "Welcome back Baxter Bearcat!"

Scenario: log in with Facebook
  # When I log in with Facebook
  # Then I am on the Binghamton Bearclub's "Dashboard Page"
  # And I should see "Welcome back Baxter Bearcat!"
