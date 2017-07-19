class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name
  validates :username, presence: true, uniqueness: true

  enum role: ['pupil', 'tutor', 'admin']
end
