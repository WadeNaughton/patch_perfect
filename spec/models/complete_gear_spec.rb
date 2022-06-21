require 'rails_helper'

RSpec.describe CompleteGear, type: :model do
  describe 'relations' do
    it {should belong_to(:complete)}
    it {should belong_to(:user_gear)}

  end

  describe 'validations' do
    it {should validate_presence_of(:complete_id)}
    it {should validate_presence_of(:user_gear_id)}
  end
end
