Feature: Check account page

  Scenario: Check account page/change password/add address/add CC
    Given User is log in
    When user is on the Ma account page he change password and relog with new one
    Then He add address and changed address and delete it.
    And Add CC

