Feature: Welcome
    Scenario: I should see login text
        Given I am on the homepage
        Then I should see "Login"

    Scenario: I should see login button
        Given I am on the homepage
        Then I should see a button with text "Login"
    
    Scenario: I should see text to create an account
        Given I am on the homepage
        Then I should see "Create An Account"
    
    Scenario: I should see a button to create an account
        Given I am on the homepage
        Then I should see a button with text "Sign Up"

    Scenario: I should see a FAQ's button
        Given I am on the homepage
        Then I should see a button with text "FAQ's"

    Scenario: I click login button and am takin to login page
        Given I am on the homepage
        When I click the button with text "Login"
        Then I should be on the login page
    
    Scenario: I click create account button and am taken to create account page
        Given I am on the homepage
        When I click the button with text "Sign Up"
        Then I should be on the create account page
    
    Scenario: I click FAQ's button and am taken to FAQ's page
        Given I am on the homepage
        When I click the button with text "FAQ's"
        Then I should be on the FAQ's page

 