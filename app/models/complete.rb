class Complete < ApplicationRecord
  belongs_to :hike
  belongs_to :user

  validates_presence_of :hike_id
  validates_presence_of :user_id
end
