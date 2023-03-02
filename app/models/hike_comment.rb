class HikeComment < ApplicationRecord

    belongs_to :hike

    validates :body, presence: true
  
    has_one_attached :image

end