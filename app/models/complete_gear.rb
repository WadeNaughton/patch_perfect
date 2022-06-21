class CompleteGear < ApplicationRecord
  belongs_to :complete
  belongs_to :user_gear

  validates_presence_of :complete_id
  validates_presence_of :user_gear_id

end
