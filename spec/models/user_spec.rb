require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:username)}
    it {is_expected.to validate_uniqueness_of(:username)}
    it {is_expected.to have_many(:user_topics)}
    it {is_expected.to have_many(:topics).through(:user_topics)}
    it {is_expected.to have_many(:tutor_dates)}
    it {is_expected.to have_many(:pairings)}
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

  describe 'instance methods' do
    describe '#open_dates'do
      it "should return only dates with no pairing" do
        tutor = create(:tutor, :with_dates, date_count: 3)
        user = create(:user)
        topic = create(:topic)
        pairing = create(:pairing, pupil_id: user.id, tutor_id: tutor.id,
                         topic_id: topic.id, tutor_date_id: tutor.tutor_dates.last.id)

        result = tutor.open_dates

        expect(result).to include(tutor.tutor_dates.first)
        expect(result).to_not include(tutor.tutor_dates.last)
      end
    end
  end
end
