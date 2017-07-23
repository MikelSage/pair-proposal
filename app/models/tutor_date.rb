class TutorDate < ApplicationRecord
  belongs_to :user
  validates :date, presence:true

  def formatted_date
    date.strftime('%b %d, %Y at %-l:%M')
  end
end
