require 'rails_helper'

RSpec.describe Complete, type: :model do
  describe 'relations' do
    it {should belong_to(:user)}
    it {should belong_to(:hike)}
  end
end
