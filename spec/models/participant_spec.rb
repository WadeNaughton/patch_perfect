require 'rails_helper'

RSpec.describe Participant, type: :model do
    describe 'validations' do
        it {should validate_presence_of(:user_id)}
        it {should validate_presence_of(:complete_id)}
        
    end
    describe 'relations' do
        it {should belong_to(:complete)}
        it {should belong_to(:user)}
        it {should have_many(:guest_costs)}
        it {should have_many(:participant_comments)}
    end
   
end
