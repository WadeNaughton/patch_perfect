class Comment < ApplicationRecord
  belongs_to :complete

  validates :body, presence: true

  has_one_attached :image
end
