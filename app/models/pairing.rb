class Pairing < ApplicationRecord
  belongs_to :topic
  belongs_to :tutor_date
  belongs_to :tutor, class_name: "User", foreign_key: 'tutor_id'
  belongs_to :pupil, class_name: "User", foreign_key: 'pupil_id'

end
