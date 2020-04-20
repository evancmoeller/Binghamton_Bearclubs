Feature: User can view a club's information
  
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
  Then I should see "Welcome back Baxter Bearcat!"
  When I follow "Search Page"
  Then I am on the "Clubs Page"
  
  Given the following clubs exist:
  | name | description         |
  | test | Lorem Ipsum ....... |
  
  Then 1 seed clubs should exist
  And I should see "test"

@omniauth_test
Scenario: View clubs information
  Given I am on the "Clubs Page"
  Then I should see "test"
  When I go to the "Show Page" for "test"
  Then I should see "test"
  When I follow "Back to All Clubs"
  Then I should be on the "Clubs Page"