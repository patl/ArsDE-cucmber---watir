Feature: Check account page

  Scenario: open the site and create new user
    Given User is on the home page
    Then User go to register page
    Then User press on the create new user
    And User add his data and create account
    When user is on the Ma account page he change password and relog with new one
    Then He add address and changed address and delete it.
    And Add CC