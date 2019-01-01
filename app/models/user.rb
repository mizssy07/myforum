class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD = /\A[a-z\d]{6,32}+\z/i

  validates :name, {presence: true, length: { in: 1..24 }}
  validates :email, {presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }}
  validates :password, {presence: true, format: {with: VALID_PASSWORD}}

end
