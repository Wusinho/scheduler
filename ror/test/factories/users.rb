FactoryBot.define do
  factory :user do
    full_name = Faker::Name.name.split(' ')
    email { Faker::Internet.email }
    name { full_name.first }
    last_name { full_name.last }
    username { Faker::Games::LeagueOfLegends.champion }
    password { '123456' }
  end
end
