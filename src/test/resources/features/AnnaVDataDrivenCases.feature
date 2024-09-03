Feature: DD test scenarios

  Scenario Outline: DD login with Selenium WebDriver methods
    Given AnnaV launch <sApplicationName>
    Then AnnaV page title is <sPageName>
    And AnnaV click on "Login" button
    And AnnaV type <sEmailContent> into "Email" textfield
    And AnnaV type <sPasswordContent> into "Password" textfield
    Then AnnaV click on "SignIn" button
    Examples:
      | sApplicationName  | sPageName    |  sEmailContent           |  sPasswordContent   |
      | "MedicalCenterV2" | "Medicenter" |  "patientpcs3@gmail.com" |  "abc123" |
      | "MedicalCenterV2" | "Medicenter" |  "patientpcs1@gmail.com" |  "abc123" |
      | "MedicalCenterV2" | "Medicenter" |  "patientpcs2@gmail.com" |  "abc123" |
      | "MedicalCenterV2" | "Medicenter" |  "patientpcs34@gmail.com" |  "abc123" |
      | "MedicalCenterV2" | "Medicenter" |  "administratorpcs2@gmail.com" |  "abc123" |
      | "MedicalCenterV2" | "Medicenter" |  "dfsfdsfdsfsd" |  "abc123" |
      | "MedicalCenterV2" | "Medicenter" |  "administratorpcs2@gmail.com" |  "1325465454564654564" |

  Scenario Outline: Login as Patient
    Given I open url <url>
    When I click on element with xpath <xpath>
    Then I wait for element with xpath <xpath1> to be present
    Then element with xpath <xpath2> should be present
    Then I type <text> into element with xpath <xpath3>
    Then I type <text1> into element with xpath <xpath4>
    And I click on element with xpath <xpath5>
    Then I wait for element with xpath <xpath6> to be present
    And element with xpath <xpath6> should contain text <text2>
    And element with xpath <xpath7> should be displayed
    Then I click on element with xpath <xpath8>
    Then I wait for element with xpath <xpath9> to be present
    Then I type <text3> into element with xpath <xpath10>
    Then I wait for <sec> sec
    Then I click on element with xpath <xpath11>
    And I type <text4> into element with xpath <xpath12>
    Then I wait for <sec> sec
    And I click on element with xpath <xpath13>
    Then I click on element with xpath <xpath14>
    Then I wait for element with xpath <xpath15> to be present
    Then element with xpath <xpath16> should contain text <text5>
    Then I wait for element with xpath <xpath17> to be present
    And I click on element with xpath <xpath17>
    Then I wait for element with xpath <xpath18> to be present
    And element with xpath <xpath18> should contain text <text6>
    And I click on element with xpath <xpath19>
    Then I wait for <sec> sec
    And element with xpath <xpath15> should not be present
    Examples:
      | url                                  | xpath                                | xpath1                  | xpath2                                 | text                    | xpath3                 | text1    | xpath4                    | xpath5                                 | xpath6                                     | text2             | xpath7                                    | xpath8                                             | xpath9                                           | text3                      | xpath10                  | sec | xpath11                                       | text4        | xpath12               | xpath13                                 | xpath14                             | xpath15                                            | xpath16                                                                        | text5                            | xpath17                                                                          | xpath18                                                                 | text6                                          | xpath19                                           |
      | "https://medicenter-qa2.vercel.app/" | "//button[contains(text(),'Login')]" | "//label[@for='email']" | "//a[contains(text(),'Back to home')]" | "patientpcs3@gmail.com" | "//input[@id='email']" | "abc123" | "//input[@id='password']" | "//button[contains(text(),'Sign in')]" | "//h1[contains(text(),'Alice Primaland')]" | "Alice Primaland" | "//h1[contains(text(),'Medical Center')]" | "//button[contains(text(),'Make an appointment')]" | "//span[contains(text(),'Make an appointment')]" | "AnnaV unique appointment" | "//textarea[@id='note']" | 1   | "//select[@name='employee_id']/..//option[8]" | "08/30/2024" | "//input[@id='date']" | "//button[contains(text(),'10:15 AM')]" | "//button[contains(text(),'Save')]" | "//p[contains(text(),'AnnaV unique appointment')]" | "//p[contains(text(),'AnnaV unique appointment')]/ancestor::article/div[1]/h3" | "Thursday 29 August 2024, 10:15" | "//p[contains(text(),'AnnaV unique appointment')]/ancestor::article/div[2]/span" | "//h2[contains(text(),'Are you sure you want to cancel appointment?')]" | "Are you sure you want to cancel appointment?" | "//button[contains(text(),'Cancel appointment')]" |