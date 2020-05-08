Feature: display clubs filtered by criteria 

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
Scenario: restrict to clubs in 'Economics & Business' subcategory of the 'Academic' category
  When I uncheck all subcategories
  And I check the following subcategories: Economics & Business
  And I press "filter_submit"
  Then I should see "Finance Society"
  And I should not see "HackBU"
  And I should not see "ACM"
  And I should not see "Outdoors Club"
  And I should not see "Circle K"
  
@omniauth_test
Scenario: restrict to clubs in 'Outdoors' subcategory and 'CS & Engineering' subcategory of the 'Academic' category
  When I uncheck all subcategories
  And I check the following subcategories: Outdoors, CS & Engineering
  And I press "filter_submit"
  Then I should see "Outdoors Club"
  And I should see "HackBU"
  And I should see "ACM"
  And I should not see "Finance Society"
  And I should not see "Circle K"
  