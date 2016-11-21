Feature: Check header on ArsDe

  Scenario: User cen see some elements on the header
    Given user goes to Arsmunfi de site
    When The site is open user observe the Logo
    And Observe the Header links
    And Observe the Menu links
    Then Check Search functionality
