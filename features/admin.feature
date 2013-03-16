Feature: Admin
  
  Scenario: Admin log in
    Given the admin is on the home page
    Then he should see the admin sign in link
    When he clicks the admin link
    Then he should be on the admin sign in page
    When he signs in as admin
    Then he should be logged in
    
   Scenario: Admin wants to update the database
    Given the admin visits admin tool page
    Then he should be on the admin tools page
    When he clicks the link to update airports
    Then he should be on the update airports page