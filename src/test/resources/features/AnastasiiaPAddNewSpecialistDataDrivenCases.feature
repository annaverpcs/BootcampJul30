#Author: Anastasiia Prykhodko
# JIRA ID JUL-392

Feature: Test Add And Delete Specialist https://medicenter-qa2.vercel.app/admin
  Background:
    Given I open url "https://medicenter-qa2.vercel.app/auth/sign_in"
    Then I wait for element with xpath "//input[@id='email']" to be present
    Then I type "administratorpcs1@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for element with xpath "//h1[contains(text(),'Mary Poppins')]" to be present
    And I wait for element with xpath "//button[contains(text(),'Add specialist')]" to be present

  Scenario Outline: Test https://medicenter-qa2.vercel.app/admin administrator add specialist with all possible configurations
    Then I wait for element with xpath "//button[contains(text(),'Add specialist')]" to be present
    Then I click on element with xpath "//button[contains(text(),'Add specialist')]"
    Then I wait for element with xpath "//span[contains(text(),'New specialist')]" to be present
    Then I type <sSpecialistFirstName> into element with xpath "//input[@id='first_name']"
    And element with xpath "//label[contains(text(),'Last name')]" should be present
    Then I type <sSpecialistLastName> into element with xpath "//input[@id='last_name']"
    And element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I click on element with xpath "//option[@value='doctor']"
    Then I click on element with xpath <xpathRole>
    And element with xpath "//label[contains(text(),'Working hours')]" should be present
    Then I click on element with xpath <xpathDay>
    Then I type "08:00" into element with xpath "//input[@id='working_hours.monday.from']"
    Then I type "16:00" into element with xpath "//input[@id='working_hours.monday.to']"
    Then I click on element with xpath "//button[@type='submit']"
    Then I refresh the page
    Then I wait for employee with name <sFullName> and role <sRole> to be present
    Examples:
      | sSpecialistFirstName | sSpecialistLastName      |  xpathRole                           |  xpathDay                   | sFullName         | sRole             |
      | "JohnAP"             | "DoeAP"                  | "//option[@value='doctor']"          |  "//button[@id='monday']"   | "JohnAP DoeAP"    | "Doctor"          |
      | "JohnAP1"            | "DoeAP!"                 | "//option[@value='doctor']"          |  "//button[@id='monday']"   | "JohnAP1 DoeAP!"  | "Doctor"          |
      | "JohnAP!"            | "DoeAP1"                 | "//option[@value='ophthalmologist']" |  "//button[@id='monday']"   | "JohnAP! DoeAP1"  | "Ophthalmologist" |