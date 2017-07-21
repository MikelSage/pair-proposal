require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:username)}
    it {is_expected.to validate_uniqueness_of(:username)}
    it {is_expected.to have_many(:user_topics)}
    it {is_expected.to have_many(:topics).through(:user_topics)}
  end

  describe 'creation' do
    it "is a pupil by default" do
      user = create(:user)

      expect(user.role).to eq 'pupil'
      expect(user.pupil?).to be_truthy
    end

    it "can be created as a tutor" do
      user = create(:tutor)

      expect(user.role).to eq 'tutor'
      expect(user.tutor?).to be_truthy
    end

    it "can be created as a admin" do
      user = create(:admin)

      expect(user.role).to eq 'admin'
      expect(user.admin?).to be_truthy
    end
  end
end
