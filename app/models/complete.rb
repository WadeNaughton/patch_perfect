class Complete < ApplicationRecord
  belongs_to :hike
  belongs_to :user

  has_many :comments

  validates_presence_of :hike_id
  validates_presence_of :user_id
  has_one_attached :image, :dependent => :destroy
end
