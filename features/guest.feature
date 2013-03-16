Feature: Guest
  
  Scenario: Visiting home page
    Given a guest visits the home page
    Then he should see a login link
  
  Scenario: Looking at statistics
    Given the guest is on the home page
    And he wants to visit the statistics page
    And he clicks the statistics link
    Then he should see a chart
  
  Scenario: Guest tries to make a review
    Given the guest tries to access the new review page
    Then he should be redirected to sign in page