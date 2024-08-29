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
    Then I click on element with xpath "//button[contains(text(),'Make an appointment')]"
    Then I wait for element with xpath "//label[contains(text(),'Info')]" to be present
    #New appointment form
    Then I type "checkup" into element with xpath "//textarea[@id='note']"
    Then I click on element with xpath "//select[@name='employee_id']/option"
    Then I wait for element with xpath "//option[@value='cba47802-70c2-47b4-ace1-64b73354edb8']" to be present
    Then I click on element with xpath "//option[@value='cba47802-70c2-47b4-ace1-64b73354edb8']"

    And I wait for 1 sec

    And I type "08/28/2024" into element with xpath "//input[@id='date']"
    And I wait for 3 sec
    And I click on element with xpath "//button[contains(text(),'08:00 AM')]"
    And I click on element with xpath "//button[contains(text(),'Save')]"
    And element with xpath "//button[contains(text(),'Save')]" should be present
    Then I wait for 3 sec

    # Verifying the appointment as saved
    And element with xpath "//article[last()]" should be present
    And at least one "article" element should contain the text "Artemii Batinov"
    And at least one "article" element should contain the text "checkup"
    And at least one "article" element should contain the text "Tuesday 27 August 2024, 08:00"
