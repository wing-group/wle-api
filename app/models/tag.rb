class Tag < ApplicationRecord
  belongs_to :users
  belongs_to :topics
  belongs_to :verses
end
