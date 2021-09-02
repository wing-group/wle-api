class Book < ApplicationRecord
  validates :book_lookup, presence: true, uniqueness: true, format: { with: /[123a-z]{3,5}/ }

  validates :name, presence: true

  validates :chapters, presence: true, numericality: { only_integer: true } 

  has_many :verses
end
