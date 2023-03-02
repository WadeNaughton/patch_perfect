require 'date'

class Hike < ApplicationRecord
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

  def self.find_hike(search)
   where("concat_ws(' ' , name, features) ILIKE ?", "%#{search}%")
  end

end
