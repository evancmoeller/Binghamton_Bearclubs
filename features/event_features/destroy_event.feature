Feature: delete an event
  
Background:
  Given I am on the "Welcome Page"
  And I follow "Session Reset"
  
  Given the following users exist:
  | name           | email                   | acct_type | b_number  | major | grad_year | 
  | Baxter Bearcat | bbearcat@binghamton.edu | Admin     | B00123456 | Math  | 2023      |
  
  Given the following authorizations exist:
  | provider | uid      | user_id |
  | github   | 12345678 | 1       | 
  
  When I Sign Up or Log In with "GitHub"
  And  I follow "Search Page"
  Then I am on the "Clubs Page"
  
  Given the following clubs exist:
  | name            | description                      | category     | subcategory                      | url                                                    | image                  |
  | HackBU          | HackBU mock description          | Academic     | CS & Engineering                 | https://club.hackbu.org/                               | HackBU_logo.png        |
  | ACM             | ACM mock description             | Academic     | CS & Engineering                 | http://binghamtonacm.com/                              | ACM_logo.png           |
  | Finance Society | Finance Society mock description | Academic     | Economics & Business             | http://bingfinance.org/                                | finance_society.png    |
  | Outdoors Club   | Outdoors Club  mock description  | Recreational | Outdoors                         | https://bengaged.binghamton.edu/outdoorsclubclub/home/ | outdoors_club_logo.png |
  | Circle K        | Circle K  mock description       | Activism     | Community Service & Philanthropy | http://bingcirclek.weebly.com/                         | circle_k_logo.png      |
  
  Then 5 seed clubs should exist

@omniauth_test
Scenario: Delete an event
  Given I have an admin account
  When I go to the "Club Show Page" for "HackBU"
  And I press "View Events"
  Then I should be on the "Events Page" for "HackBU"
  When I press "Create New Event"
  Then I should be on the "Create New Event Page" for "HackBU"
  When I fill in "name" with "Sample Event"
  And I fill in "description" with "Description of Sample Event."
  And I fill in "location" with "Sample Location"
  And I press "save_changes"
  Then I should be on the "Events Page" for "HackBU"
  And I should see "You successfully created Sample Event."
  When I follow "Sample Event"
  Then I should be on the "Event Show Page" for "Sample Event" in "HackBU"
  When I press "delete_club_event"
  Then I should be on the "Events Page" for "HackBU"
  And I should see "You successfully deleted Sample Event."