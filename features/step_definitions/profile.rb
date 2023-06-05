Given('I am logged in as a user') do
    visit "/login"
    user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
    fill_in("Email", with: "wade@bob.com")
    fill_in("Password", with: "test")
    click_button("Log in")
end

When('I visit my profile page') do
    visit "/users/#{User.last.id}"
end

When('I click on the {string} link') do |string|
    click_link(string)
end

Then('I should be on the add user gear page') do
    expect(page).to have_current_path("/users/#{User.last.id}/gear/new")
end


Then('I fill in the form with valid information and I click the submit button') do
    fill_in("Name", with: "test")
    fill_in("Pounds", with: 5)
    fill_in("Ounces", with: 5)
    click_button("Submit")
end

Then('I should see the gear listed on my profile') do
    expect(page).to have_content("test")
    expect(page).to have_content("5.0 lbs 5 oz")
end

