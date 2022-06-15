require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
    it {should have_many(:favorites)}
    it {should have_many(:completes)}
    it {should have_many(:user_gears)}
  end
  describe 'validations' do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
  end
end
