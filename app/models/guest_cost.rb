class GuestCost < ApplicationRecord

    belongs_to :participant

    validates :price, presence: true
    validates :item, presence: true
    validates :participant_id, presence: true


end