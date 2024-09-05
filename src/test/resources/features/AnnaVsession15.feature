#Author: Anna Verkhovskaya
# Jira ID 1233
@medicenter
Feature: Test Search Engine https://duckduckgo.com

  Scenario: Test https://duckduckgo.com search functionality
    Given I open url "https://duckduckgo.com/"
    Then I type "tomatoes" into element with xpath "//input[@id='searchbox_input']"
    And I click on element with xpath "//button[@type='submit']"
    Then element with xpath "//input[@id='search_form_input']" should be present
    Then element with xpath "//input[@id='search_form_input']" should have attribute "value" as "tomatoes"
    Then element with xpath "//div[@id='react-layout']" should contain text "tomatoes"
    And I wait for 1 sec
    
