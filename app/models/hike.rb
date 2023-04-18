require 'date'

class Hike < ApplicationRecord
  scope :prominence , -> { order(prominence: :desc) }
  scope :elevation , -> { order(elevation: :desc) }
  scope :hike_name , -> { order(name: :asc) }
  scope :location , -> { order(location: :asc) }
  scope :range , -> { order(range: :asc) }
  
  
  paginates_per 10
  has_many :favorites
  has_many :completes
  has_many :hike_comments

  validates_presence_of :name
  validates_presence_of :elevation
  validates_presence_of :prominence
  validates_presence_of :state
  validates_presence_of :location
  validates_presence_of :range
  validates_presence_of :features

  # def self.find_hike(search)
  #  where("concat_ws(' ' , name, features) ILIKE ?", "%#{search}%")
  # end

  
  

end
