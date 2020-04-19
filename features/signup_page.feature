Feature: sign up
  
Background: navigate to "Sign Up Page"
  When I go to the Binghamton Bearclub's "Welcome Page"
  And I press "sign_up"
  Then I am on the Binghamton Bearclub's "Sign Up Page"

Scenario: sign up (successful)
  When I fill in "first_name" with "Kevin"
  When I fill in "last_name" with "Henneberger"
  When I fill in "email_address" with "khenneb1@binghamton.edu"
  When I fill in "b_number" with "B00652013"
  When I fill in "username" with "khenneb1"
  When I fill in "password" with "password123"
  And I select "Economics" from "major"
  And I select "May" from "grad_month"
  And I select "2020" from "grad_year"

Scenario: sign up  (unsuccessful)
  When I fill in "first_name" with "Kevin"
  When I fill in "last_name" with "Henneberger"
  When I fill in "email_address" with "khenneb1@gmail.com"
  When I fill in "b_number" with "B00652013"
  When I fill in "username" with "khenneb1"
  When I fill in "password" with "password123"
  And I select "Economics" from "major"
  And I select "May" from "grad_month"
  And I select "2020" from "grad_year"