FactoryBot.define do
  factory :account do
    status { :active }

    association :user

    trait :inactive do
      status { :inactive }
    end
  end
end
