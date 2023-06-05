When('I click on the sign up button') do
 click_button("Sign Up")
end

Then('I should be on the sign up page') do
expect(page).to have_current_path("/register")
end

Then('I fill in enter  email address') do
 fill_in("Email", with: "wade@wade.com")
end

Then('I fill in a password') do
    fill_in("Password", with: "test")
end

Then('I fill in a password confirmation') do
    fill_in("Password confirmation", with: "test")
end

Then('I fill in a first name') do
 fill_in("First name", with: "wade")
end

Then('I fill in a last name') do
    fill_in("Last name", with: "wade")
end

Then('I fill in a username') do
    fill_in("Username", with: "wade")
end

Then('I press the submit button') do
    click_button("Submit")
end

Then('I should be on my profile page') do
    expect(page).to have_current_path("/users/#{User.last.id}")
end

Then('I should see a message saying email has already been taken') do
pending # Write code here that turns the phrase above into concrete actions
end

