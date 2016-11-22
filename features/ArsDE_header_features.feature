Feature: Check header on ArsDe

  Scenario: User cen see some elements on the header
    Given User is on the home page
    When The site is open user observe the Logo
    And Observe the Header links
    And Observe the Menu links
    Then Check Search functionality
