Feature: Medical Center Test Scenarios using Selenium WebDriver methods

  Scenario: Login as Administrator
    #Given I open url "https://medicenter-qa2.vercel.app/"
    Given AnnaV launch "MedicalCenter V2"
    When I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//label[@for='email']" to be present
    Then element with xpath "//a[contains(text(),'Back to home')]" should be present