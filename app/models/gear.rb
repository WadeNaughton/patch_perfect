class Gear < ApplicationRecord
  belongs_to :complete


  validates_presence_of :weight
  validates_presence_of :name
end
