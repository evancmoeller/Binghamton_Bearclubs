Feature: display clubs that match search criteria

Background:
  Given I am on the "Welcome Page"
  And I follow "Session Reset"
  
  Given the following users exist:
  | name           | email                   |
  | Baxter Bearcat | bbearcat@binghamton.edu |
  
  Given the following authorizations exist:
  | provider  | uid        | user_id |
  | github    | 12345678   | 1       | 

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
Scenario: search for 'ACM' (match)
  When I check all subcategories
  And I fill in "search" with "ACM"
  And I press "search_submit"
  Then I should see "ACM"
  And I should not see "HackBU"
  And I should not see "Finance Society"
  And I should not see "Outdoors Club"
  And I should not see "Circle K"
  
@omniauth_test
Scenario: search 'Indoors Club' (unmatched)
  When I check all subcategories
  And I fill in "search" with "Indoors Club"
  And I press "search_submit"
  Then I should see "Sorry, a club with that name does not exist."
  