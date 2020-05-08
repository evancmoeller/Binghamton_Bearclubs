Feature: welcome page
  
Scenario: display welcome page
  When I go to the "Welcome Page"
  Then I should see "Welcome Bearcats!"
  And I should see "Log in or Sign up for a New Account"