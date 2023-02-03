# Zip-Code-Integration-with-Salesforce
Zipcodebase API allows developers to get details of City by searching Zip Code of any city in the world.
The API accepts HTTP 'GET' calls and returns JSON formatted responses.
There can be multiple Json objects for single Zipcode with different address/location Information.\
You need to signup on Zipcodebase to get API Key.

## Paramaters:
**Example 1 (Search for only one Zipcode)**
https://app.zipcodebase.com/api/v1/search?apikey=<Your_API_Key>&codes=<Zip_Code_Number>

**Example 2 (Search for multiple Zipcodes)**
https://app.zipcodebase.com/api/v1/search?apikey=<Your_API_Key>&codes=<Zip_Code1>,<Zip_Code2>,<Zip_Code3>,...

## Returns:
`Postal Code`
`Branch area`
`City`
`City code`
`State`
`State Code`
`County Code`
`Latitude`
`Longitude`

## Read all about zipcodebase API
https://app.zipcodebase.com/
