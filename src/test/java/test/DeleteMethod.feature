Feature: Put request to update record in server

  Background: 
    * url 'https://reqres.in/api'
    * header accept = 'application/json'

  Scenario: Delete Demo 1
    Given path '/users/8'
    When method delete
    Then status 204
    And print response
