require 'rails_helper'

RSpec.describe Complete, type: :model do
  describe 'relations' do
    it {should belong_to(:user)}
    it {should belong_to(:hike)}
  end
  describe 'validations' do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:hike_id)}
  end
end
