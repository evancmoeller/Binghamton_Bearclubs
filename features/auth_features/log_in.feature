Feature: 3rd party authenticated log in

Background: clear session, user and authorization exist
  Given I am on the "Welcome Page"
  And I follow "Session Reset"
  
  Given the following users exist:
  | name           | email                   |
  | Baxter Bearcat | bbearcat@binghamton.edu |
  
  Given the following authorizations exist:
  | provider | uid      | user_id |
  | github   | 12345678 | 1       | 
  
  Then 1 seed authorizations should exist
  And 1 seed users should exist
  
@omniauth_test
Scenario: login for app
  When I Sign Up or Log In with "GitHub"
  Then I should see "Welcome back Baxter Bearcat!"
  And I should see "Log out"
