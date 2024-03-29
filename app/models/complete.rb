class Complete < ApplicationRecord
  belongs_to :hike
  belongs_to :user

  has_many :comments
  has_many :complete_gears
  has_many :participants
  has_many :costs
  has_many :users, through: :participants
  has_many :guest_costs, through: :participants
  has_many :user_gears, through: :complete_gears
  has_many :participant_comments, through: :participants


  validates_presence_of :hike_id
  validates_presence_of :user_id
  validates_presence_of :title, :allow_blank => true

  def total_weight
    pounds = complete_gears.joins(:user_gear).sum(:pounds)
    ounces = complete_gears.joins(:user_gear).sum(:ounces)
    converted_ounces = ounces * 0.0625
    total = pounds + converted_ounces
    total
    
  end

  def total_cost
    costs.sum(:price)
  end


  def total_guest_cost
    participants.joins(:guest_costs).sum(:price)
  end
  


  def grouped_gear
    complete_gears.group_by do |gear|
      [gear.user_gear.user.id, gear.user_gear.user.first_name]
    end
  end

end
