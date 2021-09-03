class Topic < ApplicationRecord
  validates :topic, presence: true, uniqueness: true

  has_many :tags
  has_many :topics, through: :tags
  has_many :verses, through: :tags
end
