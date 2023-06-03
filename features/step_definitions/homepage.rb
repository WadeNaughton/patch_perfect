Given('I am on the homepage') do
    visit "/"
end

Then('I should see {string}') do |string|
    expect(page).to have_content(string)
end

Then('I should see a button with text {string}') do |string|
    expect(page).to have_button(string)
end

