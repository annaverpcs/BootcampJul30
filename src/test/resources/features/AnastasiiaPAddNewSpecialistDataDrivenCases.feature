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
    Then I wait for 10 sec
    Then I wait for employee with name <sFullName> and role <sRole> to be present
    Then I scroll to the element with xpath <xpathEmployeeDelete> with offset 10
    Then I click on element with xpath <xpathEmployeeDelete>
    And I wait for element with xpath "//button[text()='Remove specialist']" to be present
    Then I click on element with xpath "//button[text()='Remove specialist']"
    Then I wait for 10 sec
    Then I wait for employee with name <sFullName> and role <sRole> to not be present
    Examples:
      | sSpecialistFirstName | sSpecialistLastName      |  xpathRole                           |  xpathDay                   | sFullName         | sRole             | xpathEmployeeDelete |
      | "JohnAP"             | "DoeAP"                  | "//option[@value='nurse']"           |  "//button[@id='monday']"   | "JohnAP DoeAP"    | "Nurse"           | "//td[contains(text(),'JohnAP DoeAP')]/..//span[contains(text(), 'Nurse')]/../..//span[contains(text(), 'delete')]" |
      | "JohnAP1"            | "DoeAP!"                 | "//option[@value='doctor']"          |  "//button[@id='monday']"   | "JohnAP1 DoeAP!"  | "Doctor"          | "//td[contains(text(),'JohnAP1 DoeAP!')]/..//span[contains(text(), 'Doctor')]/../..//span[contains(text(), 'delete')]" |
      | "JohnAP!"            | "DoeAP1"                 | "//option[@value='ophthalmologist']" |  "//button[@id='monday']"   | "JohnAP! DoeAP1"  | "Ophthalmologist" |"//td[contains(text(),'JohnAP! DoeAP1')]/..//span[contains(text(), 'Ophthalmologist')]/../..//span[contains(text(), 'delete')]" |