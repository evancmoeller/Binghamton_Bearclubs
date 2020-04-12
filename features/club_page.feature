Feature: club page
  
Background: clubs have been added to database
    Given the following clubs exist:
    | name | description         | admins |
    | test | blah, blah, blah... | none   |
    
    And I am on the page for "test"
    
  
Scenario: display club information
  Then I should see "test"
  And I should see "blah, blah, blah..."
  And I should see "none"
  And I should see "Upcoming Event"
  And I should see "Join Club!"
  
Scenario: interact with club (open)
  When I press "Join Club"
  Then I should see "Join"
  And I should see "Follow"
  When I press "Join"
  Then I should see "Joined"

  
  
  