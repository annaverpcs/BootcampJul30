package definitions;

import io.cucumber.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class AnastasiiaPStepDefs {
    @Then("I refresh the page")
    public void iRefreshPage() {;
        getDriver().navigate().refresh();
    }
    @Then("I wait for employee with name {string} and role {string} to be present")
    public void iWaitForElementWithXpathToBePresent(String name, String role) {
        new WebDriverWait(getDriver(), Duration.ofSeconds(10)).until(ExpectedConditions.presenceOfElementLocated(By
                .xpath("//td[contains(text(),'" + name + "')]/..//span[contains(text(), '" + role + "')]")));
    }
    @Then("I wait for employee with name {string} and role {string} to not be present")
    public void iWaitForElementWithXpathToNotBePresent(String name, String role) {
        new WebDriverWait(getDriver(), Duration.ofSeconds(10)).until(ExpectedConditions.not(ExpectedConditions.presenceOfAllElementsLocatedBy(By
                .xpath("//td[contains(text(),'" + name + "')]/..//span[contains(text(), '" + role + "')]"))));
    }
    @Then("AnastasiiaP wait for element with xpath {string} to not be present")
    public void iWaitForElementWithXpathToNotBePresent(String xpath) {
        new WebDriverWait(getDriver(), Duration.ofSeconds(10)).until(ExpectedConditions.not(ExpectedConditions.presenceOfAllElementsLocatedBy(By.xpath(xpath))));
    }
}
