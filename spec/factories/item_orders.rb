FactoryBot.define do
  factory :item_order do
    user_id       { 1 }
    item_id       { 1 }
    token         { 'tok_abcdefghijk00000000000000000' }
    post_code     { '111-1111' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Gimei.address.kanji }
    block         { Gimei.town.to_s }
    building      { '偽名ビル10A号' }
    telephone     { Faker::PhoneNumber.subscriber_number(length: 11) }
  end
end
