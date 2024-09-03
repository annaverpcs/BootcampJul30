#Author: Ruslan

  Feature: Medical Center Test Scenarios for User Story 6

    Background: Login as patient with valid data
      Given Ruslan launch MediCenter
      When Ruslan click on Login
      And Ruslan enters email and password
      And Ruslan click on Sign In
      Then Ruslan login has been successful

  Scenario: Make an appointment
  Given I click on element with xpath "//button[contains(text(),'Make an appointment')]"
  When I wait for element with xpath "//span[text()='Make an appointment']" to be present
  And I type "sick" into element with xpath "//textarea[@name='note']"
    And I wait for 2 sec
    And Ruslan select specialist
  And I type "09/17/2024" into element with xpath "//input[@id='date']"
  And I wait for element with xpath "//button[contains(text(),'11:45 AM')]" to be present
    And I click on element with xpath "//button[contains(text(),'11:45 AM')]"
  And I click on element with xpath "//button[text()='Save']"
  And I wait for element with xpath "//h3[@class='font-medium text-lg']" to be present
  Then element with xpath "//h3[@class='font-medium text-lg']" should contain text "Monday 16 September 2024, 11:45"

Scenario: Delete an appointment
  Given I wait for element with xpath "//p[contains(text(),'sick')]/ancestor::article/div[2]/span" to be present
  And I click on element with xpath "//p[contains(text(),'sick')]/ancestor::article/div[2]/span"
  And I wait for element with xpath "//h2[contains(text(),'Are you sure')]" to be present
  And I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
  And I wait for 2 sec
  Then element with xpath "//p[contains(text(),'sick')]" should not be present

  Scenario: Make the appointment without date
    Given I click on element with xpath "//button[contains(text(),'Make an appointment')]"
    When I wait for element with xpath "//span[text()='Make an appointment']" to be present
    And I type "sick" into element with xpath "//textarea[@name='note']"
    And I wait for 2 sec
    And Ruslan select specialist
    And I click on element with xpath "//button[text()='Save']"
    Then element with xpath "//span[text()='Make an appointment']" should contain text "Make an appointment"

  Scenario: Make the appointment without select specialist
    Given I click on element with xpath "//button[contains(text(),'Make an appointment')]"
    When I wait for element with xpath "//span[text()='Make an appointment']" to be present
    And I type "sick" into element with xpath "//textarea[@name='note']"
    And I type "09/17/2024" into element with xpath "//input[@id='date']"
    And I click on element with xpath "//button[text()='Save']"
    Then element with xpath "//span[text()='Make an appointment']" should contain text "Make an appointment"

    Scenario: Button "Contact" is available
    Given I click on element with xpath "//a[@href='/contact']"
      Then Ruslan collects all the names of the elements on the page
      
    Scenario: Patient can logout
      Given I click on element with xpath "//button[text()='Logout']"
      Then I wait for element with xpath "//h1[text()='Medical Center']" to be present