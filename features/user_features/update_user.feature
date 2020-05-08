Feature: update user
  
Background: 
  Given I am on the "Welcome Page"
  And I follow "Session Reset"
  
  Given the following users exist:
  | name           | email                   | acct_type | b_number  | major | grad_year | 
  | Baxter Bearcat | bbearcat@binghamton.edu | Standard  | B00123456 | Math  | 2023      |
  
  Given the following authorizations exist:
  | provider | uid      | user_id |
  | github   | 12345678 | 1       | 
  
  When I Sign Up or Log In with "GitHub"
  Then I am on the "Dashboard Page"
  And I follow "Account Profile"
  And I press "edit_user" 
  Then I am on the "User Edit Page" for "Baxter Bearcat"

@omniauth_test
Scenario: edit account
  When I select "Standard" from "acct_type"
  And I fill in "b_number" with "B00123456"
  And I select "Economics" from "major"
  And I fill in "grad_year" with "2023"
  And I press "submit_button"
  Then I should be on the "Dashboard Page"
  And I should see "You successfully updated your account."
  