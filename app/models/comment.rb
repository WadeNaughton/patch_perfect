class Comment < ApplicationRecord
  belongs_to :complete

  validates :body, presence: true
end
