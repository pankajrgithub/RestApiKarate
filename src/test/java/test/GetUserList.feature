Feature: Get List User

  Background: 
    * url 'https://reqres.in/api'

  #Simple Get request
  Scenario: Get List of all user
    Given url 'https://reqres.in/api/users?page=2'
    When method Get
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #Get with Background
  Scenario: Get Demo2
    Given path '/users?page=2'
    When method Get
    Then status 200

  #Get with path,param
  Scenario: Get Demo3
    Given path '/users'
    And param page = 2
    When method Get
    Then status 200
    And print response

  #Get with Assertions
  Scenario: Get demo4
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name == 'Michael'
    And assert response.data.length == 6
    And match response.data[0].first_name != null
    And match $.data[3].id == 10
    
    
