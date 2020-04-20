Feature: User can create a new club
  
Background: clear session, user and authorization exist
  Given I am on the "Welcome Page"
  And I follow "Session Reset"
  
  Given the following users exist:
  | name           | email                   |
  | Baxter Bearcat | bbearcat@binghamton.edu |
  
  Given the following authorizations exist:
  | provider  | uid        | user_id |
  | github    | 12345678   | 1       | 

  When I Sign Up or Log In with "GitHub"
  Then I should see "Welcome back Baxter Bearcat!"
  When I follow "Search Page"
  Then I am on the "Clubs Page"

@omniauth_test
Scenario: Create a Club
  When I follow "Create a Club"
  Then I should be on the "Create New Club Page"
  When I fill in "name" with "test"
  And I fill in "description" with "Lorem Ipsum ......."
  And I press "Save Changes"
  Then I should be on the "Clubs Page"
  And I should see "'test' was created."
