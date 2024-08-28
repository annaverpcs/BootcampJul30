# author: Anna V
#Medical Center testing


Feature: Medical Center Test Scenarios

  Scenario: Login as Administrator
    Given I open url "https://medicenter-qa2.vercel.app/"
    When I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//label[@for='email']" to be present
    Then element with xpath "//a[contains(text(),'Back to home')]" should be present
      # Login page
    Then I type "administratorpcs2@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[contains(text(),'Sign in')]"
      #Home page
    Then I wait for element with xpath "//h1[contains(text(),'Calvin Grant')]" to be present
    And element with xpath "//h1[contains(text(),'Calvin Grant')]" should contain text "Calvin Grant"
    And element with xpath "//h1[contains(text(),'Medical Center')]" should be displayed

