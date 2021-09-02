class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password # :password is present, has a length <= 72, and matches :password_confirmation
  validates :password, length: { minimum: 8 }

  validates :display, allow_nil: true

  enum access_level: { standard: 0, admin: 1, founder: 2 }

  enum default_version: { esv: 0, kjv: 1, nkjv: 2, niv: 3, nasb: 4 }

  has_many :tags
  has_many :topics, through: :tags
  has_many :verses, through: :tags
end
