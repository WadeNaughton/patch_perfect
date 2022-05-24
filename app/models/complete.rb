class Complete < ApplicationRecord
  belongs_to :hike
  belongs_to :user

  has_many :comments
  has_many :photos

  validates_presence_of :hike_id
  validates_presence_of :user_id
end
