FactoryBot.define do
  factory :tag do
    name { Faker::Coffee.unique.variety }
  end
end
