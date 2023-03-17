class ParticipantComment < ApplicationRecord

    belongs_to :participant

    validates :body, presence: true
    validates :participant_id, presence: true


    has_one_attached :image



end