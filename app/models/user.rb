class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name
  validates :username, presence: true, uniqueness: true

  has_many :user_topics
  has_many :topics, through: :user_topics
  has_many :tutor_dates
  has_many :pairings, class_name: 'Pairing', foreign_key: 'pupil_id'

  enum role: ['pupil', 'tutor', 'admin']
end
