FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.unique.email }
    password              { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation {password}
    last_name             {'永安'}
    first_name            {'菜美穂'}
    last_name_kana        {'ナガヤス'}
    first_name_kana       {'ナミホ'}
    birth_date              { Faker::Date.birthday }
  end
end