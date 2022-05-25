class Complete < ApplicationRecord
  belongs_to :hike
  belongs_to :user

  has_many :comments
  has_many :photos
  has_many :gears

  validates_presence_of :hike_id
  validates_presence_of :user_id

  def total_weight
    gears.sum(:weight)
  end
end
