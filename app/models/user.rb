class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  validates :user_name, presence: true, length: { maximum: 50 }
  # validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX},
  #                   uniqueness: { case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
end
