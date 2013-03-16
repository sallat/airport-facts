Feature: Search
  
  Scenario: Searching for an airport
    Given a user visits the home page
    And he should see a welcome text
    And he decides to click search
    Then he should be on the search page
    When he searches for airports in Test
    Then the search should be processed