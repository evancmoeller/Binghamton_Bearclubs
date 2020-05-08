Feature: join club

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
Scenario: Join a club
  When I go to the "Club Show Page" for "HackBU"
  And I press "join_club"
  Then I should be on the "Club Show Page" for "HackBU"
  And I should see "Congratulations, you are now a member of HackBU!"
  When I go to the "Dashboard Page"
  Then I should see "HackBU"
