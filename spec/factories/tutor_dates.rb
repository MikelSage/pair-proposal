FactoryGirl.define do
  factory :tutor_date do
    sequence :date do |n|
      DateTime.now + n
    end
    duration 30
    user
  end
end
