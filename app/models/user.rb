class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password # :password is present, has a length <= 72, and matches :password_confirmation
  validates :password, length: { minimum: 8 }

  validates :display, allow_nil: true

  enum access_level: [:standard, :admin, :founder]

  enum default_version: [:kjv, :nkjv, :esv, :niv, :nasb]

  has_many :tags
  has_many :topics, through: :tags
  has_many :verses, through: :tags
end
