package implementation;

import java.util.List;

import org.junit.Assert;

import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import io.restassured.specification.RequestSpecification;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;



public class stepdefinition {
	String URL;
	RequestSpecification request;
	JsonPath jsonpath;
	String response;
	String countries;
	String country;
	
	// below step definition is to get country passing postcode	
	
	@Given("^the rest API is \"([^\"]*)\"$")
	public String the_rest_API_is(String PostCodeURL) throws Throwable {		
		URL = PostCodeURL;		
		return URL;	    
	}
	
	@When("^the postcode is \"([^\"]*)\"$")
	public void the_postcode_is(String PostCode) throws Throwable {
		request =   RestAssured.given();
		response = request.get(URL+PostCode).asString();
		jsonpath = new JsonPath(response).setRoot("result");
	}
	
	@Then("^validate the country \"([^\"]*)\"$")
	public void validate_the_country(String Country) throws Throwable {	 
		country = jsonpath.get("country");
		Assert.assertEquals(Country, country);
		System.out.println("The expected country is -> "+Country);
		System.out.println("The Actual country is -> "+country);
	}
	
	
	// Below step definition is for getting the country passing Long and lat
	
	@Given("^rest API is \"([^\"]*)\"$")
	public String rest_API_is(String LongLatURL) throws Throwable {
		URL = LongLatURL;		
		return URL;	 	   
	}
	
	@When("^the longitude is\"([^\"]*)\" and latitude is \"([^\"]*)\"$")
	public void the_longitude_is_and_latitude_is(String Long, String lat) throws Throwable {
		request =   RestAssured.given();
		response = request.get(URL+"lon="+Long+"&lat="+lat).asString();
		jsonpath = new JsonPath(response).setRoot("result");
	   
	}

	@Then("^validate the country from it \"([^\"]*)\"$")
	public void validate_the_country_from_it(String Country) throws Throwable {		
		countries =  jsonpath.getString("country");
		Assert.assertTrue(countries.contains(Country));
		System.out.println("The expected country is -> "+Country);
		System.out.println("The Actual country is -> "+countries);
	}

}
