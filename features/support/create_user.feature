Feature: creating users
    Scenario: create user
        Given I am on the homepage
        When I click on the sign up button
        Then I should be on the sign up page
        And I fill in enter  email address
        And I fill in a password
        And I fill in a password confirmation
        And I fill in a first name
        And I fill in a last name
        And I fill in a username
        And I press the submit button
        Then I should be on my profile page

        
   

