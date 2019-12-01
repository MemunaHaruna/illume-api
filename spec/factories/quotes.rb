FactoryBot.define do
  factory :quote do
    author { "Test author" }
    source_title { Faker::Lorem.sentence }
    content { "test content" }
    access { 0 }
    user
  end
end
