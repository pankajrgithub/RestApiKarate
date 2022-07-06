Feature: create a user in server

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('postresponse.json')

  # simple  post request
  Scenario: create a user
    Given url 'https://reqres.in/api/users'
    And request { "name": "Pankaj", "job": "Eng"}
    When method post
    Then status 201
    And print response
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #post request with background
  Scenario: post demo2
    Given path '/users'
    And request { "name": "Dinesh", "job": "Eng"}
    When method post
    Then status 201
    And print response
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #post request with Assertion
  Scenario: post demo3
    Given path '/users'
    And request { "name": "Manish", "job": "Lead"}
    When method post
    Then status 201
    And print responseTime
    And print responseHeaders
    And print responseCookies
    And match response ==  { "name": "Manish", "job": "Lead","id": "#string","createdAt": "#ignore"}
    And print response

  #post read response from file
  Scenario: post demo4
    Given path '/users'
    And request { "name": "Michael", "job": "Guard"}
    When method post
    Then status 201
    And match response == expectedOutput
    And print response

  #post read request from file in same location
  Scenario: Post demo 5
    Given path '/users'
    And def requestBody = read('request.json')
    And request requestBody
    When method post
    Then status 201
    And print response
    And match response == { "name": "Mike", "job": "Engineer","id": "#string","createdAt": "#ignore" }

  #post read payload from file in diff location
  Scenario: Post demo 6
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath+'\src\test\java\data\requestPayload.json'
    And request filePath
    When method post
    Then status 201
    And print response
    And match response == expectedOutput

  #post request update payload
  Scenario: post demo 7
    Given path '/users'
    And def readBody = read('request.json')
    And set readBody.job = 'Manager'
    And set readBody.name = 'Kally'
    And request readBody
    When method post
    Then status 201
    And print response
