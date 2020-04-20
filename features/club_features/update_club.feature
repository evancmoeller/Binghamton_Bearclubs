Feature: User can update a club
  
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
  Then I should see "test"

@omniauth_test
Scenario: Update a club
  Given I am on the "Clubs Page"
  Then I should see "test"
  When I go to the "Show Page" for "test"
  And I follow "Edit Club"
  Then I should be on the "Edit Page" for "test"
  When I fill in "name" with "temp"
  And I fill in "description" with "Once upon a time...."
  And I press "Update Club"
  Then I should be on the "Clubs Page"
  And I should see "'temp' was updated."
  And I should see "temp"