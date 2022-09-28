FactoryBot.define do
  factory :worker do
    full_name = Faker::Name.name.split(' ')
    email { Faker::Internet.email }
    name { full_name.first }
    last_name { full_name.last }
  end
end
