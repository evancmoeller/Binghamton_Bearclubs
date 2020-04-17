Feature: User can delete a club
  
Scenario: Delete a club
  Given the following clubs exist:
  | name    | description           |
  | test    | Lorem Ipsum .......   |
  And I am on the clubs page
  Then I should see "test"
  When I go to the show page for "test"
  And I press "Delete Club"
  Then I should be on the clubs page
  And I should see "'test' was deleted."