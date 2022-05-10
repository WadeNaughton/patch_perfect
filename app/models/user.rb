class User < ApplicationRecord
  has_many :favorites
  has_many :completes

  has_many :hikes, through: :favorites
  has_many :hikes, through: :completes

  validates_presence_of :password_digest
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :username

  has_secure_password
end
