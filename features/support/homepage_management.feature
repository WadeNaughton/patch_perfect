Feature: Welcome
    Scenario: I should see login text
        Given I am on the homepage
        Then I should see "Login"

    Scenario: I should see login button
        Given I am on the homepage
        Then I should see a button with text "Login"

 