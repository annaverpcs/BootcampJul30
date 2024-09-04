#Author: Anastasiia Prykhodko
# JIRA ID JUL-392

Feature: Test Add And Delete Specialist https://medicenter-qa2.vercel.app/admin
  Background:
    Given I open url "https://medicenter-qa2.vercel.app/auth/sign_in"
    Then I type "administratorpcs1@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for element with xpath "//h1[contains(text(),'Mary Poppins')]" to be present
    And I wait for element with xpath "//button[contains(text(),'Add specialist')]" to be present
  Scenario: Test https://medicenter-qa2.vercel.app/admin administrator add specialist function
    And element with xpath "//h1[contains(text(),'Medical Center')]" should be present
    And element with xpath "//button[contains(text(),'Logout')]" should be present
    And element with xpath "//button[contains(text(),'Specialists')]" should be present
    And element with xpath "//button[contains(text(),'Appointments')]" should be present
    And element with xpath "//button[contains(text(),'Add specialist')]" should be present
    Then I click on element with xpath "//button[contains(text(),'Add specialist')]"
    Then I wait for element with xpath "//span[contains(text(),'New specialist')]" to be present
    And element with xpath "//span[contains(text(),'close')]" should be present
    And element with xpath "//label[contains(text(),'Data')]" should be present
    And element with xpath "//label[contains(text(),'First name')]" should be present
    Then I type "JohnAP" into element with xpath "//input[@id='first_name']"
    And element with xpath "//label[contains(text(),'Last name')]" should be present
    Then I type "DoeAP" into element with xpath "//input[@id='last_name']"
    And element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I click on element with xpath "//option[@value='doctor']"
    Then I click on element with xpath "//option[@value='ophthalmologist']"
    And element with xpath "//label[contains(text(),'Working hours')]" should be present
    Then I click on element with xpath "//button[@id='monday']"
    Then I type "08:00" into element with xpath "//input[@id='working_hours.monday.from']"
    Then I type "16:00" into element with xpath "//input[@id='working_hours.monday.to']"
    Then I click on element with xpath "//button[@id='tuesday']"
    Then I type "08:00" into element with xpath "//input[@id='working_hours.tuesday.from']"
    Then I type "16:00" into element with xpath "//input[@id='working_hours.tuesday.to']"
    Then I click on element with xpath "//button[@id='friday']"
    Then I type "08:00" into element with xpath "//input[@id='working_hours.friday.from']"
    Then I type "16:00" into element with xpath "//input[@id='working_hours.friday.to']"
    Then I click on element with xpath "//button[@type='submit']"
    Then I refresh the page
    Then I wait for employee with name "JohnAP DoeAP" and role "Ophthalmologist" to be present
  Scenario: Test https://medicenter-qa2.vercel.app/admin administrator delete just created specialist
    Then I wait for employee with name "JohnAP DoeAP" and role "Ophthalmologist" to be present
    Then I scroll to the element with xpath "//td[contains(text(),'JohnAP DoeAP')]/..//span[contains(text(), 'Ophthalmologist')]/../..//span[contains(text(), 'delete')]" with offset 100
    Then I click on element with xpath "//td[contains(text(),'JohnAP DoeAP')]/..//span[contains(text(), 'Ophthalmologist')]/../..//span[contains(text(), 'delete')]"
    And I wait for element with xpath "//button[text()='Remove specialist']" to be present
    Then I click on element with xpath "//button[text()='Remove specialist']"
    Then I wait for 5 sec
    Then I wait for employee with name "JohnAP DoeAP" and role "Ophthalmologist" to not be present

