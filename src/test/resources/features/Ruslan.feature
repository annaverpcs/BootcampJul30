#Author: Ruslan

  Feature: Medical Center Test Scenarios for User Story 6

    Scenario: Login as patient
      Given I open url "https://medicenter-qa2.vercel.app/"
      When I click on element with xpath "//button[text()='Login']"
      And I wait for element with xpath "//label[@for='email']" to be present
      And I type "patientpcs1@gmail.com" into element with xpath "//input[@id='email']"
      And I type "abc123" into element with xpath "//input[@id='password']"
      And I click on element with xpath "//button[text()='Sign in']"
      And I wait for element with xpath "//h1[contains(text(),'James Johnson')]" to be present
      Then element with xpath "//h1[contains(text(),'James Johnson')]" should contain text "James Johnson"