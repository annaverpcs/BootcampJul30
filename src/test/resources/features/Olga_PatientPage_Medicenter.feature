#Author: Olga K.
# Medical Center testing

Feature: Recreating patient's activity https://medicenter-qa2.vercel.app/
  Scenario: Login as a patient
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//label[@for='email']" to be present
    Then element with xpath "//a[contains(text(),'Back to home')]" should be present
    #Login page
    Then I type "patientpcs3@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[contains(text(),'Sign in')]"
    #Home page
    Then I wait for element with xpath "//h1[contains(text(),'Alice Primaland')]" to be present
    And element with xpath "//h1[contains(text(),'Alice Primaland')]" should contain text "Alice Primaland"
    And element with xpath "//h1[contains(text(),'Medical Center')]" should be displayed
    And I wait for 1 sec
#adding a new appointment

  #Scenario: Patient is adding a new appointment
    Then I click on element with xpath "//button[contains(text(),'Make an appointment')]"
    Then I wait for element with xpath "//label[contains(text(),'Info')]" to be present
    #New appointment form
    Then I type "checkup" into element with xpath "//textarea[@id='note']"
    And I click on element with xpath "//select[@name='employee_id']/option"
    Then I wait for element with xpath "//select[@name='employee_id']/option" to be present
    And I click on element with xpath "//select//option[@value='c36b1aa0-8058-4977-8557-f5d4912ec53e']"

    And I wait for 5 sec

  #Scenario: Patient is checking up his appointments
