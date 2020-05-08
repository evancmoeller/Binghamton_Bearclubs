Feature: display clubs sorted by different criteria

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
Scenario: sort clubs alphabetically by name
  When I check all subcategories
  And I select "Name" from "sort_criteria"
  And I press "sort_submit"
  Then I should see "ACM" before "Circle K"
  And I should see "Circle K" before "Finance Society"
  And I should see "Finance Society" before "HackBU"
  And I should see "HackBU" before "Outdoors Club"

@omniauth_test
Scenario: sort clubs alphabetically by category
  When I check all subcategories
  And I select "Category" from "sort_criteria"
  And I press "sort_submit"
  Then I should see "HackBU" before "ACM"
  And I should see "HackBU" before "Finance Society"
  
@omniauth_test
Scenario: sort clubs alphabetically by subcategory
  When I check all subcategories
  And I select "Subcategory" from "sort_criteria"
  And I press "sort_submit"
  Then I should see "Circle K" before "Outdoors Club"
  And I should see "Finance Society" before "Outdoors Club"
