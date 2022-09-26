FactoryBot.define do
  factory :department do
    name { Faker::Commerce.department(max: 1, fixed_amount: true) }
    supervised_hrs { ['5-10'] }
    organization
  end
end
