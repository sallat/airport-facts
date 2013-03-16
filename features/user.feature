Feature: User
  
  Scenario: User visits my account page
    Given the user is logged in
    And they click my page link
    Then they should see their own account page