# Wiremock Credit Restriction API

This project is the Service Virtualization example for the [credit-simulator-api](https://github.com/eliasnogueira/credit-simulator-api).

## How to run

* Start your Docker application
* Run `docker-compose up --build` in your Terminal
* Wait for the Wiremock banner

## Current implementation

There're two mappings implemented, which are necessary to run the `POST /v1/api/simulations/` in the `credit-simulator-api` project:
* simulation_with_restriction.json: return HTTP 403 for the matched request (please look at the `bodyPatterns` attribute)
  * the response body is defined in the `__files/simulation_with_restriction_response.json` 
* restriction_complete.json: return HTTP 200 which means a restriction
  * the response body is defined in the `__files/restrictions_response_200.json` 

Both are necessary because the restriction one is called internally from the POST request in the Simulations API, the simulation one is also necessary to correctly reply when a restriction is found.

Both have fixed the scenario with a restriction using the CPF `97093236014`. Any other request will be successful, returning the HTTP 201 POST request in the Simulations API.
