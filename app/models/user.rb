class User < ApplicationRecord
  has_many :favorites
  has_many :completes

  has_many :hikes, through: :favorites
  has_many :hikes, through: :completes

  validates_presence_of :password_digest
  has_secure_password
end
