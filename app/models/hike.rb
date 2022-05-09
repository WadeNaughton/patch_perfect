class Hike < ApplicationRecord
  has_many :favorites
  has_many :completes
end
