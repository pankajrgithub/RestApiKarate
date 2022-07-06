Feature: Put request to update record in server

  Background: 
    * url 'https://reqres.in/api'
    * header accept = 'application/json'

  Scenario: Put Demo1
    Given path '/users/2'
    And request {"name": "Alstair", "job": "Tech"}
    When method put
    Then status 200
    And print response
