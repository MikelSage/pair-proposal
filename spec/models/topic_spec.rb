require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_uniqueness_of(:name)}
    it {is_expected.to have_many(:user_topics)}
    it {is_expected.to have_many(:users).through(:user_topics)}
  end
end
