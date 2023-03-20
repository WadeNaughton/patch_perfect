class Cost < ApplicationRecord

    belongs_to :complete
    belongs_to :user

    validates_presence_of :item
    validates_presence_of :price
    validates_presence_of :complete_id
    validates_presence_of :user_id


    # def split_cost(cost, participants)
        
    #     split_cost = cost / participants.count
    #     return split_cost
    # end

end