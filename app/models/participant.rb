class Participant < ApplicationRecord
    belongs_to :user
    belongs_to :complete
    



    has_many :guest_costs, dependent: :destroy
    has_many :participant_comments, dependent: :destroy
    
  
    validates_presence_of :complete_id
    validates_presence_of :user_id

    
   
end
  