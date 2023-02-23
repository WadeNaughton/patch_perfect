class UserGear < ApplicationRecord
  belongs_to :user

  validates_presence_of :pounds, :allow_blank => true
  validates_presence_of :ounces, :allow_blank => true
  validates_presence_of :name
  validates_presence_of :user_id

  has_many :complete_gears, dependent: :destroy

end
