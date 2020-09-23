FactoryBot.define do
  factory :item do
    name                 { Faker::Name.name }
    text                 { Faker::Lorem.sentence}
    category_id          { "2" }
    status_id            { "2"}
    price                { "5000" }
    delivery_chager_id   { "2" }
    delivery_area_id     { "2" }
    delivery_days_id     { "2" }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
