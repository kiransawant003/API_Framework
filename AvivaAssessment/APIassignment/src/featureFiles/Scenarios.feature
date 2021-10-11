Feature: This is to check the GeoLocation for the below API

@GeoLocation_PassingPostCode_Valid_Scenario
Scenario Outline: Getting GeoLocation passing valid postcodes
 Given the rest API is "<URL>"  
 When the postcode is "<postcode>"
 Then validate the country "<country>"
Examples:
|URL|postcode|country|
|https://api.postcodes.io/postcodes/|OX49 5NU|England|



@GeoLocation_PassingPostCode_INVALID_Scenario
Scenario Outline: Getting geolocation by passing invalid p
 Given the rest API is "<URL>"
 When the postcode is "<postcode>"
 Then validate the country "<Country>"
Examples:
|URL|postcode|Country|
|https://api.postcodes.io/postcodes/|OX49 5NU|India|



@GeoLocation_PassingLongLat_VALID_Scenario
Scenario Outline: Getting geolocation by passing Invalid Long & Lat
 Given rest API is "<URL>"
 When the longitude is"<longitude>" and latitude is "<latitude>"
 Then validate the country from it "<country>" 
Examples:
|URL|longitude|latitude|country|
|http://api.postcodes.io/postcodes?|0.629834723775309|51.7923246977375|England|



@GeoLocation_PassingLongLat_INVALID_Scenario
Scenario Outline: Getting geolocation by passing valid Long&Lat
 Given rest API is "<URL>"
 When the longitude is"<longitude>" and latitude is "<latitude>"
 Then validate the country from it "<country>" 

Examples:
|URL|longitude|latitude|country|
|http://api.postcodes.io/postcodes?|0.629834723775309|51.7923246977375|India|

