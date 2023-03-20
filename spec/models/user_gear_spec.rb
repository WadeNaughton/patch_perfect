require 'rails_helper'

RSpec.describe UserGear, type: :model do
  describe 'relations' do
    it {should belong_to(:user)}
    it {should have_many(:complete_gears)}
  end
  describe 'validations' do
    # it {should validate_presence_of(:pounds)}
    it { should allow_value("", nil).for(:pounds) }
    # it {should validate_presence_of(:ounces)}
    it { should allow_value("", nil).for(:ounces) }
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:user_id)}
  end
end
