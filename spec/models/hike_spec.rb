require 'rails_helper'

RSpec.describe Hike, type: :model do
  describe 'relations' do
    it {should have_many(:favorites)}
    it {should have_many(:completes)}
  end
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:elevation)}
    it {should validate_presence_of(:prominence)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:location)}
    it {should validate_presence_of(:range)}
    it {should validate_presence_of(:features)}
  end
end
