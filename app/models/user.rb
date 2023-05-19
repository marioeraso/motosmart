class User < ApplicationRecord
  
  has_many :records
  has_many :rankings, through: :records

  # mount_uploader :avatar, AvatarUploader
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, uniqueness: true
  validates :password_digest,
            length: { minimum: 6 },
            if: -> { new_record? || !password_digest.nil? }
end
