package definitions;

import io.cucumber.java.en.Given;

import static support.TestContext.getDriver;

public class AnnaVStepdefs {
    @Given("AnnaV launch {string}")
    public void annavLaunch(String arg0) {
        getDriver().get("https://medicenter-qa2.vercel.app/");

    }
}
