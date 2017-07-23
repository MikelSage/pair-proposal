require 'rails_helper'

RSpec.describe Pairing, type: :model do
  describe 'validations' do
    it {is_expected.to belong_to(:topic)}
    it {is_expected.to belong_to(:tutor)}
    it {is_expected.to belong_to(:pupil)}
    it {is_expected.to belong_to(:tutor_date)}
  end
end
