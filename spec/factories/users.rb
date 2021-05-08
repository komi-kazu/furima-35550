FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'aaa111'}
    password_confirmation {password}
    last_name             {'田中'}
    first_name            {'太郎'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'タロウ'}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2050-01-01')}

  end
end
