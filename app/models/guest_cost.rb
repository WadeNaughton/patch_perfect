class GuestCost < ApplicationRecord

    belongs_to :participant

    validates :price, presence: true
    validates :item, presence: true
    validates :participant_id, presence: true


          # @guest_costs = GuestCost.where(participant_id: @participant.id, complete_id: @complete.id)

   


end