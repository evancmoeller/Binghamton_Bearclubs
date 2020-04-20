Feature: 3rd party authenticated sign up
  
Background: clear session
  Given I am on the "Welcome Page"
  And I follow "Session Reset"

@omniauth_test
Scenario: sign up with GitHub
  When I Sign Up or Log In with "github"
  Then I am on the "Dashboard Page"
  Then I should see "Log out"
  #Then I should see message "Welcome Baxter Bearcat! You have signed up via Github."