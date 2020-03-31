Feature: club page
  
Scenario: display club information
  When I go to the club page "test"
  Then I should see "Club Name"
  And I should see "Club Description"
  And I should see "Club Admin Names"
  And I should see "Upcoming Event"
  And I should see "Join Club!"
  
Scenario: interact with club (open)
  When I go to the club page "test"
  And I click "Join Club"
  Then I should see "Join"
  And I should see "Follow"
  When I click "Join"
  Then I should see "Joined"

  
  
  