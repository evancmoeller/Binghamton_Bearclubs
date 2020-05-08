Feature: update club
  
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
  And I follow "Search Page"
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
Scenario: Update a club
  Given I am on the "Clubs Page"
  Then I should see "HackBU"
  Given I have an admin account
  When I go to the "Club Show Page" for "HackBU"
  And I press "edit_club"
  Then I should be on the "Club Edit Page" for "HackBU"
  When I fill in "name" with "HackNYU"
  And I press "save_changes"
  Then I should be on the "Clubs Page"
  And I should see "You successfully updated HackNYU."
  And I should see "HackNYU"