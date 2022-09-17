class Participant < ApplicationRecord
    belongs_to :user
    belongs_to :complete
  
    validates_presence_of :complete_id
    validates_presence_of :user_id
   
end
  