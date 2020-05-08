Feature: create club
  
Background: 
  Given I am on the "Welcome Page"
  And I follow "Session Reset"
  
  Given the following users exist:
  | name           | email                   | acct_type | b_number  | major | grad_year | 
  | Baxter Bearcat | bbearcat@binghamton.edu | Admin     | B00123456 | Math  | 2023      |
  
  Given the following authorizations exist:
  | provider | uid      | user_id |
  | github   | 12345678 | 1       | 

  When I Sign Up or Log In with "GitHub"
  And I follow "Search Page"
  Then I am on the "Clubs Page"

@omniauth_test
Scenario: Create a club
  Given I have an admin account
  When I press "create_club"
  Then I should be on the "Create New Club Page"
  When I fill in "name" with "Sample Club"
  And I fill in "description" with "Description of Sample Club."
  And I select "Academic" from "category"
  And I select "Economics & Business" from "subcategory"
  And I fill in "url" with "https://sampleclub.edu/"
  And I fill in "image" with "sampleclubclub_logo.png"
  And I press "save_changes"
  Then I should be on the "Clubs Page"
  And I should see "You successfully created Sample Club."
