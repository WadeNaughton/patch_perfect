require 'rails_helper'

RSpec.describe GuestCost, type: :model do
    describe 'validations' do
        it { should validate_presence_of :price }
        it { should validate_presence_of :item }
        it { should validate_presence_of :participant_id }
    end

    describe 'relationships' do
        it { should belong_to :participant }
    end

end
