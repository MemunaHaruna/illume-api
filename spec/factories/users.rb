FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    avatar_url {"random_url"}
    provider { "test" }
    unique_id { 12345 }
  end
end
