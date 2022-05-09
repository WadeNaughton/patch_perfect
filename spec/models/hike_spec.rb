require 'rails_helper'

RSpec.describe Hike, type: :model do
  describe 'relations' do
    it {should have_many(:favorites)}
    it {should have_many(:completes)}
  end
end
