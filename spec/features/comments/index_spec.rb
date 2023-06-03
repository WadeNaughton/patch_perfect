RSpec.describe 'Completed hike show page page' do
    before do
      @user = User.create!(first_name: 'wade', last_name: 'wade', username: "wade", email:"wade@bob.com", password: "test", password_confirmation: "test")
      @hike = Hike.create!(name: 'hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
      @hike2 = Hike.create!(name: 'new hike', elevation: 4000, prominence: 200, state: 'NH', location: 'Lincoln', range: 'Lincoln', features: "waterfalls")
  
      @complete = Complete.create!(hike_id: @hike2.id, user_id: @user.id)
  
      visit ("/login")
      fill_in('Email', with: 'wade@bob.com')
      fill_in('Password', with: 'test')
      click_button('Log in')
  
    end

    it "has link to add a journal entry" do
        visit("/users/#{@user.id}/hikes/#{@hike2.id}/complete")
        expect(page).to have_button("Add Entry")
        click_button("Add Entry")
        expect(current_path).to eq("/users/#{@user.id}/hikes/#{@hike2.id}/comment/new")
    
        fill_in("body", with: "test")
        click_button("Submit")
        expect(current_path).to eq("/users/#{@user.id}/hikes/#{@hike2.id}/complete")
        click_button("View all entries")
        expect(page).to have_content("test")
        expect(page).to have_content("wade")
    end
end

        