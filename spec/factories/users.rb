FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '111aaa' }
    password_confirmation { password }
    family_name           { Gimei.name.last.kanji }
    first_name            { Gimei.name.first.kanji }
    family_name_kana      { Gimei.name.last.katakana }
    first_name_kana       { Gimei.name.first.katakana }
    birthday              { '1980-01-01' }
  end
end
