require 'rails_helper'

RSpec.describe TutorDate, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:date)}
  end
end
