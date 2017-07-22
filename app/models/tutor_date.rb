class TutorDate < ApplicationRecord
  has_many :arrangements
  has_many :users, through: :arrangements
end
