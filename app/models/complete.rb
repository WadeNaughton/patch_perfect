class Complete < ApplicationRecord
  belongs_to :hike
  belongs_to :user

  has_many :comments
  has_many :photos
  has_many :complete_gears
  has_many :participants

  validates_presence_of :hike_id
  validates_presence_of :user_id

  def total_weight
    pounds = complete_gears.joins(:user_gear).sum(:pounds)
    ounces = complete_gears.joins(:user_gear).sum(:ounces)
    converted_ounces = ounces * 0.0625
    total = pounds + converted_ounces
    total
    
  end

end
