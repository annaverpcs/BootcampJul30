#Author: Anastasiia Prykhodko
# JIRA ID JUL-392

Feature: Test Patient Account Page https://medicenter-qa2.vercel.app/
  Background:
    Given I open url "https://medicenter-qa2.vercel.app/auth/sign_in"
    Then I wait for element with xpath "//input[@id='email']" to be present
    Then I type "wanejop983@orsbap.com" into element with xpath "//input[@id='email']"
    Then I type "123abc" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for element with xpath "//h1[contains(text(),'AJane Doe')]" to be present

  Scenario: Test https://medicenter-qa2.vercel.app/ patient account page without appointments
    And element with xpath "//a[contains(text(),'My appointments')]" should be present
    And element with xpath "//a[contains(text(),'Contact')]" should be present
    And element with xpath "//h1[contains(text(),'Medical Center')]" should be present
    And element with xpath "//button[contains(text(),'Make an appointment')]" should be present
    And element with xpath "//button[contains(text(),'Logout')]" should be present
    And element with xpath "//h2[contains(text(),'Your appointments')]" should be present
    And element with xpath "//h2[contains(text(),'have any appointments')]" should be present

  Scenario: Test https://medicenter-qa2.vercel.app/ patient makes an actual appointment with note
    Then I click on element with xpath "//button[contains(text(),'Make an appointment')]"
    Then I wait for element with xpath "//span[text()='Make an appointment']" to be present
    Then I type "annual check-up" into element with xpath "//textarea[@name = 'note']"
    Then I click on element with xpath "//option[text()='Choose specialist']"
    Then I wait for element with xpath "//option[@value='492998a7-cb41-4f54-a684-b8f0ad7174f6']" to be present
    Then I click on element with xpath "//option[@value='492998a7-cb41-4f54-a684-b8f0ad7174f6']"
    Then I click on element with xpath "//input[@id='date']"
    Then I type "10012024" into element with xpath "//input[@id='date']"
    Then I wait for element with xpath "//button[@role='radio'][1]" to be present
    Then I click on element with xpath "//button[@role='radio'][1]"
    Then I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "(//h3)[1]" to be present
    Then I wait for element with xpath "//p[text()='annual check-up']" to be present
    And element with xpath "//h2[contains(text(),'Your appointments')]" should be present
    And element with xpath "(//h3)[1]" should be present
    And element with xpath "(//span[text()='description'])[1]" should be present
    And element with xpath "(//span[text()='description']/../p)[1]" should be present
    And element with xpath "(//span[text()='face'])[1]" should be present
    And element with xpath "(//span[text()='face']/../p)[1]" should be present
    And element with xpath "(//span[text()='update'])[1]" should be present

  Scenario: Test https://medicenter-qa2.vercel.app/ patient decides not to cancel the only active appointment
    And element with xpath "(//span[text()='update'])[1]" should be present
    Then I click on element with xpath "(//span[text()='update'])[1]"
    Then I wait for element with xpath "//h2[text()='Are you sure you want to cancel appointment?']" to be present
    And element with xpath "//button[text()='Cancel appointment']" should be present
    Then I click on element with xpath "//span[text()='close']"
    Then I wait for element with xpath "(//span[text()='update'])[1]" to be present

  Scenario: Test https://medicenter-qa2.vercel.app/ patient cancels the only active appointment
    Then element with xpath "(//span[text()='update'])[1]" should be present
    Then I click on element with xpath "(//span[text()='update'])[1]"
    Then I wait for element with xpath "//h2[text()='Are you sure you want to cancel appointment?']" to be present
    Then I click on element with xpath "//button[text()='Cancel appointment']"
    Then I wait for element with xpath "//h2[contains(text(),\"You don't have any appointments\")]" to be present

  Scenario: Test https://medicenter-qa2.vercel.app/ patient makes an actual appointment without any note
    Then I click on element with xpath "//button[contains(text(),'Make an appointment')]"
    Then I wait for element with xpath "//span[text()='Make an appointment']" to be present
    Then I click on element with xpath "//option[text()='Choose specialist']"
    Then I wait for element with xpath "//option[@value='492998a7-cb41-4f54-a684-b8f0ad7174f6']" to be present
    Then I click on element with xpath "//option[@value='492998a7-cb41-4f54-a684-b8f0ad7174f6']"
    Then I click on element with xpath "//input[@id='date']"
    Then I type "10012024" into element with xpath "//input[@id='date']"
    Then I wait for element with xpath "//button[@role='radio'][1]" to be present
    Then I click on element with xpath "//button[@role='radio'][1]"
    Then I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "(//h3)[1]" to be present
    And element with xpath "(//span[text()='description']/../p)[1]" should not be present

