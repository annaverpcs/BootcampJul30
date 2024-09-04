package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class AnnaVStepDefs {
    @Given("AnnaV launch {string}")
    public void annavLaunch(String sApplicationName) {
        switch(sApplicationName) {
            case "MedicalCenterV2": //getDriver().get("https://medicenter-qa2.vercel.app/");
                getDriver().get(xPathLibrary.sMedicalCenterURLV2);
                break;
            case "MedicalCenterV1": getDriver().get(xPathLibrary.sMedicalCenterURLV1);
                break;
            case "Google": getDriver().get(xPathLibrary.GoogleURL);
                break;
            default:
                System.out.println("There is no URL found for this particular web page name");

        }

    }

    @Then("AnnaV page title is {string}")
    public void annavPageTitleIs(String sPageName) {
        assertThat(getDriver().getTitle().contains(sPageName));
    }

    @And("AnnaV click on {string} button")
    public void annavClickOnButton(String sButtonName) {
        switch(sButtonName){
            case "Login": getDriver().findElement(By.xpath(xPathLibrary.sLoginButton)).click();
                break;
            case "SignIn": getDriver().findElement(By.xpath(xPathLibrary.sSignInButton)).click();
                break;
            default:
                System.out.println("There is no such button on the page");



        }
    }

    @And("AnnaV type {string} into {string} textfield")
    public void annavTypeIntoTextfield(String sText, String sTextFieldName) {
        switch(sTextFieldName){
            case "Email": getDriver().findElement(By.xpath(xPathLibrary.sEmailTextField)).sendKeys(sText); break;
            case "Password":getDriver().findElement(By.xpath(xPathLibrary.sPasswordTextField)).sendKeys(sText); break;
            default:
                System.out.println("There is no such element on the page");



        }
    }
}