Feature: show user
  
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

@omniauth_test
Scenario: sign up
  When I follow "Account Profile"
  Then I should be on the "User Show Page" for "Baxter Bearcat"
  And I should see "Name: Baxter Bearcat"
  And I should see "Email: bbearcat@binghamton.edu"
  And I should see "Account Type: Standard"
  And I should see " B-Number: B00123456"
  And I should see "Major: Math"
  And I should see "Graduation Year: 2023"
  