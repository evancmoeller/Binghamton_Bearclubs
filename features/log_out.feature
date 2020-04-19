Feature: log out

Background: user have been added to database and logged in on the dashboard page
  
  Given the following users exist:
  | name           | email                    |
  | Baxter Bearcat | bbearcat1@binghamton.edu |
  
  Then 1 seed users should exist
  Given I am on the Binghamton Bearclub's "Welcome Page"
  # When I press "github"
  # Then I am on the Binghamton Bearclub's "Dashboard Page"
  # And I should see "Welcome back Baxter Bearcat!"

Scenario: log out
  # When I press "Log out"
  # Then I am on the Binghamton Bearclub's "Welcome Page"
  # And I should see "You were successfully logged out."