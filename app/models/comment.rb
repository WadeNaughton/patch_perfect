class Comment < ApplicationRecord
  belongs_to :complete
  


  validates :body, presence: true
  validates :complete_id, presence: true

  has_one_attached :image

end
