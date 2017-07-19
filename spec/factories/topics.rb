FactoryGirl.define do
  factory :topic do
    sequence :name, 'A' do |n|
      "Topic #{n}"
    end
  end
end
