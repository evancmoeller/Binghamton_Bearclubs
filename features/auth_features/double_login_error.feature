Feature: double login error

Background: clear session, user and authorization exist
  Given I am on the "Welcome Page"
  And I follow "Session Reset"
  
  Given the following users exist:
  | name           | email                   |
  | Baxter Bearcat | bbearcat@binghamton.edu |
  
  Given the following authorizations exist:
  | provider | uid      | user_id |
  | github   | 12345678 | 1       | 
   
  When I Sign Up or Log In with "GitHub"
  Then I am on the "Dashboard Page"
  
@omniauth_test
Scenario: try to log in again by manually setting URL
  Given I visit the "Welcome Page"
  When I Sign Up or Log In with "GitHub"
  Then I am on the "Welcome Page"
  # Then I should see error message "You are already logged in"
  