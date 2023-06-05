Feature: Profile
    Scenario: Logged in user can add gear to their profile
        Given I am logged in as a user
        When I visit my profile page
        And I click on the "Add Gear To The Shed" link
        Then I should be on the add user gear page
        And I fill in the form with valid information and I click the submit button
        
        Then I should see the gear listed on my profile