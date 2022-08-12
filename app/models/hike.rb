require 'date'

class Hike < ApplicationRecord
  has_many :favorites
  has_many :completes

  validates_presence_of :name
  validates_presence_of :elevation
  validates_presence_of :prominence
  validates_presence_of :state
  validates_presence_of :location
  validates_presence_of :range
  validates_presence_of :features

  def self.find_hike(search)
   where("concat_ws(' ' , name, features) ILIKE ?", "%#{search}%")
  end

  def self.coord_to_s(hike)
    lat = hike.latitude
    lon = hike.longitude

    string = "#{lat},#{lon}"
    string
  end

   


end
