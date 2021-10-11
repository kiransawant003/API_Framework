package implementation;

import java.util.Scanner;

import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import io.restassured.specification.RequestSpecification;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(monochrome = true, plugin = { "pretty",
		"json:src/reports/cucumber-json.json" }, features = "src/featureFiles/", glue = "implementation", tags = "@GeoLocation_PassingPostCode_INVALID_Scenario", dryRun = false)
public class RunnerFile {
	static Scanner sc = new Scanner(System.in);
	static String PostCode;
	public static void main(String args[]) {
		RequestSpecification httpRequest = RestAssured.given();
		System.out.print("Please enter postcode");
		PostCode = sc.nextLine();	
		String response = httpRequest.get("https://api.postcodes.io/postcodes/"+PostCode).asString();
		JsonPath jsonpath = new JsonPath(response).setRoot("result");
		String country = jsonpath.get("country");
		System.out.println("The country is ==>  " + country);
	}

}
