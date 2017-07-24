class TutorDate < ApplicationRecord
  belongs_to :user
  has_many :pairings, dependent: :destroy
  validates :date, presence:true

  def formatted_date
    date.strftime('%b %d, %Y at %-l:%M')
  end
end
