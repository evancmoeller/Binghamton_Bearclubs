Feature: User can update a club
  
Scenario: Update a club
  Given the following clubs exist:
  | name    | description           |
  | test    | Lorem Ipsum .......   |
  And I am on the clubs page
  Then I should see "test"
  When I go to the show page for "test"
  And I follow "Edit Club"
  Then I should be on the edit page for "test"
  When I fill in "name" with "temp"
  And I fill in "description" with "Once upon a time...."
  And I press "Update Club"
  Then I should be on the clubs page
  And I should see "'temp' was updated."
  And I should see "temp"