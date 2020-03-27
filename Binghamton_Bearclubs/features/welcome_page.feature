Feature: welcome page
  
Scenario: display welcome page
    When I go to the Binghamton Bearclub's "Welcome Page"
    Then I should see "Welcome Bearcats!"
    And I should see "Sign up"
    And I should see "Log in"