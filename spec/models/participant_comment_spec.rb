require 'rails_helper'

RSpec.describe ParticipantComment, type: :model do
    describe 'relations' do
        it {should belong_to(:participant)}
    end
    describe 'validations' do
        it {should validate_presence_of(:body)}
        it {should validate_presence_of(:participant_id)}
    end
    describe 'image' do
        it {should have_one_attached(:image)}
    end
end