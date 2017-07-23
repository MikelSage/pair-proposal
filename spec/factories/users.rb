FactoryGirl.define do
  factory :user do
    sequence :username, 'a' do |n|
      "user_#{n}"
    end
    password "MyString"
    role 0
    sequence :name, 'A' do |n|
      "#{n}man #{n.next}dude"
    end
    bio "MyText"

    factory :tutor do
      role 1
    end

    factory :admin do
      role 2
    end

    trait :with_dates do
      transient do
        date_count 2
      end

      after(:create) do |user, evaluator|
        user.tutor_dates << create_list(:tutor_date, evaluator.date_count)
      end
    end
  end
end
