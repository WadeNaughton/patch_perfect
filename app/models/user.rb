class User < ApplicationRecord
  has_many :favorites
  has_many :completes

  has_many :hikes, through: :favorites
  has_many :hikes, through: :completes

  validates_presence_of :password_digest, presence: true
  validates_presence_of :first_name, presence: true
  validates_presence_of :last_name, presence: true
  validates_presence_of :email, presence: true
  validates_presence_of :username, presence: true 

  has_secure_password
end
