Feature: User can create a new club
  
Scenario: Create a Club
  Given I am on the clubs page
  When I follow "Create a Club"
  Then I should be on the Create New Club page
  When I fill in "name" with "test"
  And I fill in "description" with "Lorem Ipsum ......."
  And I press "Save Changes"
  Then I should be on the clubs page
  And I should see "test"