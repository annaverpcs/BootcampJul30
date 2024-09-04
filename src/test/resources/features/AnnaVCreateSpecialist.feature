# author: Anna V
#Medical Center testing

@medicenter
Feature: Medical Center Test Scenarios
  #Precondition for all scenarios in this Feature
  Background:
    Given I open url "https://medicenter-qa2.vercel.app/"
    When I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//label[@for='email']" to be present
    Then element with xpath "//a[contains(text(),'Back to home')]" should be present

  Scenario: Login as Administrator
    #Given I open url "https://medicenter-qa2.vercel.app/"
   # When I click on element with xpath "//button[contains(text(),'Login')]"
   # Then I wait for element with xpath "//label[@for='email']" to be present
   # Then element with xpath "//a[contains(text(),'Back to home')]" should be present
      # Login page
    Then I type "administratorpcs2@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[contains(text(),'Sign in')]"
      #Home page
    Then I wait for element with xpath "//h1[contains(text(),'Calvin Grant')]" to be present
    And element with xpath "//h1[contains(text(),'Calvin Grant')]" should contain text "Calvin Grant"
    And element with xpath "//h1[contains(text(),'Medical Center')]" should be displayed

  Scenario: Login as Patient
   # Given I open url "https://medicenter-qa2.vercel.app/"
   # When I click on element with xpath "//button[contains(text(),'Login')]"
   # Then I wait for element with xpath "//label[@for='email']" to be present
   # Then element with xpath "//a[contains(text(),'Back to home')]" should be present
      # Login page
    Then I type "patientpcs3@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[contains(text(),'Sign in')]"
      #Home page
    Then I wait for element with xpath "//h1[contains(text(),'Alice Primaland')]" to be present
    And element with xpath "//h1[contains(text(),'Alice Primaland')]" should contain text "Alice Primaland"
    And element with xpath "//h1[contains(text(),'Medical Center')]" should be displayed

  Scenario: Create and Delete an appointment as a Patient
    Then I type "patientpcs3@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[contains(text(),'Sign in')]"
      #Home page
    Then I wait for element with xpath "//h1[contains(text(),'Alice Primaland')]" to be present
    And element with xpath "//h1[contains(text(),'Alice Primaland')]" should contain text "Alice Primaland"
    And element with xpath "//h1[contains(text(),'Medical Center')]" should be displayed
      #patient create an appointment
    Then I click on element with xpath "//button[contains(text(),'Make an appointment')]"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "AnnaV unique appointment" into element with xpath "//textarea[@id='note']"
    Then I wait for 1 sec
      #//select[@name='employee_id']/..//option[8]" to be present
    Then I click on element with xpath "//select[@name='employee_id']/..//option[8]"
    And I type "08/30/2024" into element with xpath "//input[@id='date']"
    Then I wait for 1 sec
    And I click on element with xpath "//button[contains(text(),'10:15 AM')]"
    Then I click on element with xpath "//button[contains(text(),'Save')]"
      #patient verify that the appointment is created
    Then I wait for element with xpath "//p[contains(text(),'AnnaV unique appointment')]" to be present
    Then element with xpath "//p[contains(text(),'AnnaV unique appointment')]/ancestor::article/div[1]/h3" should contain text "Thursday 29 August 2024, 10:15"
      #delete the appointment
    Then I wait for element with xpath "//p[contains(text(),'AnnaV unique appointment')]/ancestor::article/div[2]/span" to be present
    And I click on element with xpath "//p[contains(text(),'AnnaV unique appointment')]/ancestor::article/div[2]/span"
      #confirmation pop up window should be present
    Then I wait for element with xpath "//h2[contains(text(),'Are you sure you want to cancel appointment?')]" to be present
    And element with xpath "//h2[contains(text(),'Are you sure you want to cancel appointment?')]" should contain text "Are you sure you want to cancel appointment?"
    And I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
    Then I wait for 1 sec
      #verify that the appointment is cancelled
    And element with xpath "//p[contains(text(),'AnnaV unique appointment')]" should not be present
    Then I wait for 2 sec













