FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| "email_#{ n }@email.com" }
    sequence(:email) { |n| "email_#{ n }@email.com" }
    password { "123456" }

     after(:create) do |new_user|
       create(:account, user: new_user)
     end
  end
end
