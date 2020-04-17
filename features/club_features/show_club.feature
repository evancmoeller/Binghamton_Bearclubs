Feature: User can view a club's information
  
Scenario: View clubs information
  Given the following clubs exist:
  | name    | description           |
  | test    | Lorem Ipsum .......   |
  And I am on the clubs page
  Then I should see "test"
  When I go to the show page for "test"
  Then I should see "test"
  When I follow "Back to All Clubs"
  Then I should be on the clubs page