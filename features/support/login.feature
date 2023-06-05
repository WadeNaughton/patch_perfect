Feature: Login
    Scenario: Login with valid credentials
        Given I am on the login page
        When I enter valid credentials and click login
        Then I should be on the homepage
       
    