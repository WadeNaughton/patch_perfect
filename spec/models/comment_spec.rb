require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'relations' do
    it {should belong_to(:complete)}

  end

  describe 'validations' do
    it {should validate_presence_of(:body)}
  end
end
