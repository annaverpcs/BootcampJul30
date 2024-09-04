@medicenter
Feature: Medical Center testing using Selenim WebDriver
  @regression
  Scenario: Login to Medical Center With Selenium WebDriver methods
    Given AnnaV launch "MedicalCenterV2"
    Then AnnaV page title is "Medicenter"
    And AnnaV click on "Login" button
    And AnnaV type "patientpcs3@gmail.com" into "Email" textfield
    And AnnaV type "abc123" into "Password" textfield
    Then AnnaV click on "SignIn" button
    Then I wait for 2 sec
    

