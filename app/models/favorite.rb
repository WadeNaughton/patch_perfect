class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :hike

  validates_presence_of :hike_id
  validates_presence_of :user_id
end
