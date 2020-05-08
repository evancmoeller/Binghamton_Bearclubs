Feature: sign up

Background:
  Given I am on the "Welcome Page"
  And I follow "Session Reset"

@omniauth_test
Scenario: sign up with GitHub (successful)
  When I Sign Up or Log In with "github"
  Then I should see "Welcome Baxter Bearcat! You've signed up using Github. Please complete your account by filling out this form."
  And I am on the "Dashboard Page"
  
@omniauth_test
Scenario: sign up with GitHub (unsuccessful)
  When I Sign Up or Log In with "github"
  And I am on the "Failure Page"
  And I should see "Oops! Something went wrong."