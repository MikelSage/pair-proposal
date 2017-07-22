class TutorDate < ApplicationRecord
  has_many :arrangements
  has_many :users, through: :arrangements
  accepts_nested_attributes_for :arrangements

  #time.strftime('%b-%d-%Y at %I:%M')
end
