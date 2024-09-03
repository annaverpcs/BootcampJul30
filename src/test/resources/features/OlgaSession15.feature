#Author: Olga K.

Feature: Test Search Engine https://duckduckgo.com

  Scenario: Test https://duckduckgo.com search functionality
    Given I open url "https://duckduckgo.com"
    Then I type "orange cats" into element with xpath "//input[@id='searchbox_input']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 5 sec
    Then element with xpath "//input[@id='search_form_input']" should be present
    Then element with xpath "//input[@id='search_form_input']" should have attribute "value" as "orange cats"
    Then element with xpath "//div[@id='react-layout']" should contain text "orange cats"

