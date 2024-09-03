package definitions;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import java.time.Duration;
import java.util.List;
import java.util.stream.Collectors;
import static support.TestContext.getDriver;

public class RuslanSteps {

    @Given("Ruslan launch MediCenter")
    public void ruslanLaunch() {
        getDriver().get("https://medicenter-qa2.vercel.app/");
    }

    @When("Ruslan click on Login")
    public void ruslanClickOnLogin() {
        new WebDriverWait(getDriver(), Duration.ofSeconds(5))
                .until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[text()='Login']")))
                .click();
    }

    @And("Ruslan enters email and password")
    public void ruslanEnterEmail() {
        WebElement emailField = new WebDriverWait(getDriver(), Duration.ofSeconds(5))
                .until(ExpectedConditions.presenceOfElementLocated(By.xpath("//input[@id='email']")));
        emailField.sendKeys("patientpcs1@gmail.com");

        getDriver().findElement(By.xpath("//input[@id='password']")).sendKeys("abc123");
    }

    @And("Ruslan click on Sign In")
    public void ruslanClickOnSignIn() {
        getDriver().findElement(By.xpath("//button[text()='Sign in']")).click();
    }

    @Then("Ruslan login has been successful")
    public void loginSuccessful() {
        WebElement element = new WebDriverWait(getDriver(), Duration.ofSeconds(5))
                .until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//h1[contains(text(),'James Johnson')]")));
        String expectedText = "James Johnson";

        Assert.assertEquals(element.getText(), expectedText, "Text does not match!");
    }

    @And("Ruslan select specialist")
    public void selectSpecialist() {
        WebElement selectDropDown = getDriver().findElement(By.xpath("//select[@name='employee_id']"));
        Select dropDownSpecialist = new Select(selectDropDown);
        dropDownSpecialist.selectByValue("43ab5418-f6a4-4697-875e-36fb3c22252d");
    }

    @And("Ruslan type date into element with xpath")
    public void ruslanTypeElement() {
        getDriver().findElement(By.xpath("//input[@id='date']")).sendKeys("09/17/2024");
    }

    @Then("Ruslan collects all the names of the elements on the page")
    public void list() {
        List<String> expectedResult = List.of(
                "Reception",
                "Diagnostic and Surgical Office",
                "First contact doctor's office",
                "Opening hours");

        List<WebElement> elements = getDriver().findElements(By.xpath("//div[contains(@class,'mt-8 grid')]/div/h3"));
        List<String> actualResult = elements.stream()
                .map(WebElement::getText)
                .collect(Collectors.toList());

        Assert.assertEquals(actualResult, expectedResult,
                "The result does not match the expected, actual result: " + actualResult);
    }
}