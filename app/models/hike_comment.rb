class HikeComment < ApplicationRecord

    belongs_to :hike
    belongs_to :user

    validates :body, presence: true
  
    has_one_attached :image

end