FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    password { "password"}
    trait :invalid do
      name nil
    end
  end
end
