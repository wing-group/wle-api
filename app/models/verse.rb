class Verse < ApplicationRecord
  validates :verse_lookup, presence: true, uniqueness: true, format: { with: /[123a-z]{3,5}\.\d{1,3}\.\d{1,3}/ }

  validates :chapter, presence: true, numericality: { only_integer: true } 

  validates :verse, presence: true, numericality: { only_integer: true } 

  belongs_to :book

  has_many :tags
  has_many :topics, through: :tags
  has_many :users, through: :tags
end
