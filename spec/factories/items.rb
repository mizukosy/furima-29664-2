FactoryBot.define do
  factory :item do
    name                 { Faker::Name.name }
    text                 { Faker::Lorem.sentence }
    category_id          { Faker::Number.between(from: 2, to: 11) }
    status_id            { Faker::Number.between(from: 2, to: 7) }
    price                { '5000' }
    delivery_chager_id   { Faker::Number.between(from: 2, to: 2) }
    prefecture_id        { Faker::Number.between(from: 2, to: 48) }
    delivery_days_id     { Faker::Number.between(from: 2, to: 3) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
