require 'rails_helper'

RSpec.describe TutorDate, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:date)}
    it {is_expected.to belong_to(:user)}
  end
end
