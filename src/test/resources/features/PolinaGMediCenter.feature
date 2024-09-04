@medicenter
Feature: Medical Center testing
  @medicenter
  Scenario: Login as Administrator
    Given I open url "https://medicenter-qa2.vercel.app/"
    When I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//label[@for='email']" to be present
    Then element with xpath "//a[contains(text(),'Back to home')]" should be present

    # Login page
    Then I type "administratorpcs2@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    And  I click on element with xpath "//button[contains(text(),'Sign in')]"
    
    # Home page
    Then I wait for element with xpath "//h1[contains(text(),'Calvin Grant')]" to be present
    And element with xpath "//h1[contains(text(),'Calvin Grant')]" should contain text "Calvin Grant"
    And element with xpath "//h1[contains(text(),'Medical Center')]" should be displayed
    And I wait for 2 sec

#Feature: Delete my appointment as patient
  Scenario: Delete my appointment
    Given I open url "https://medicenter-qa2.vercel.app/auth/sign_in"
    When I type "patientpcs1@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[contains(text(),'Sign in')]"
    And I wait for 2 sec

    #we're on the home page as patient

    Then I wait for element with xpath "//p[contains(text(),'Mary Phillips')]" to be present
    And element with xpath "//p[contains(text(),'Mary Phillips')]" should contain text "Mary Phillips"
    And I click on element with xpath "//span[@id=':ra:']"

    #we're opening cancel appointment window

    Then I wait for element with xpath "//h2[@class='text-2xl font-bold text-center']" to be present
    And element with xpath "//h2[@class='text-2xl font-bold text-center']" should contain text "Are you sure you want to cancel appointment?"
    And I click on element with xpath "//button[contains(text(), 'Cancel appointment')]"

    