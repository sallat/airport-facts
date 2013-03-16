Feature: Signup
  
  Scenario: User signs up
    Given someone is on the home page
    And they click the sign up link
    Then they should be on the sign up page
    When they submit the sign up form
    Then they should see a success message
