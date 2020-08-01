FactoryBot.define do
  factory :product do
    title { Faker::Lorem.word }
    association :category, factory: :category
  end

end