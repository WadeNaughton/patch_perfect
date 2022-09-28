class User < ApplicationRecord
  has_many :favorites
  has_many :completes
  has_many :user_gears
  has_many :participants

  has_many :hikes, through: :favorites
  has_many :hikes, through: :completes

  validates_presence_of :password_digest, presence: true
  validates_presence_of :first_name, presence: true
  validates_presence_of :last_name, presence: true
  validates :email, presence: true, :uniqueness => true
  validates_presence_of :username, presence: true

  has_secure_password

  has_one_attached :avatar


  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    ApplicationMailer.forgot_password(self).deliver_now# This sends an e-mail with a link for the user to reset the password
  end
  # This generates a random password reset token for the user
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
