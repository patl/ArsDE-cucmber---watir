Feature: Category page

  Scenario: Check L1 L2.. categories.
    Given User is on the home page
    When Navigate to Category page BILDER
    Then Observe the Bilder L1
    And Navigate to Category L2
    And Check the sortings
    And Check the Ref