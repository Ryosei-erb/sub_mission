FactoryBot.define do
  factory :user do
    name { "name" }
    email { "mail" }
    user_name { "user_name"}
    password { "password"}
    trait :invalid do
      name nil
    end
  end
end
