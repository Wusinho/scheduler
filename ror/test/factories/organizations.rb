FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }
    user
  end
end
