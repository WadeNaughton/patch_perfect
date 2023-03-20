require 'rails_helper'

RSpec.describe HikeComment, type: :model do

    describe 'relations' do
        it {should belong_to(:hike)}
        it {should belong_to(:user)}
    end
    describe 'validations' do
        it {should validate_presence_of(:body)}
    end
    
    describe 'image attachment' do
        it {should have_one_attached(:image)}
    end
    
    
end