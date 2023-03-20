require 'rails_helper'

RSpec.describe Cost, type: :model do
  describe 'relations' do
    it {should belong_to(:complete)}
    it {should belong_to(:user)}
  end
  describe 'validations' do
    it {should validate_presence_of(:complete_id)}
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:item)}
    it {should validate_presence_of(:price)}
  end

   
end