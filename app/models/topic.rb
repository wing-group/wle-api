class Topic < ApplicationRecord
  validates :topic, presence: true, uniqueness: true

  validates :description, allow_nil: true

  has_many :tags
  has_many :topics, through: :tags
  has_many :verses, through: :tags
end
