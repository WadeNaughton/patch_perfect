Given('I am on the homepage') do
    visit "/"
end

Then('I should see {string}') do |string|
    expect(page).to have_content(string)
end

Then('I should see a button with text {string}') do |string|
    expect(page).to have_button(string)
end

When('I click the button with text {string}') do |string|
    click_button(string)
end
  
Then('I should be on the login page') do
    expect(page).to have_current_path("/login")
end

Then('I should be on the create account page') do
    expect(page).to have_current_path("/register")
end

Then("I should be on the FAQ's page") do
    expect(page).to have_current_path("/questions")
end

  

