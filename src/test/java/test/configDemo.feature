Feature: karate-config demo

  Background: 
    * url baseUrl
    * header accept = 'application/json'

  #Simple global varible access
  Scenario: Print global varible
    Given print name

  #Simple Get request
  Scenario: Get List of all user
    Given path '/users?page=2'
    When method Get
    Then status 200
    And print response
