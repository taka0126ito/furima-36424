FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name { 'タナカ' }
    first_name { 'タロウ' }
    last_name_kana { 'タロウ' }
    first_name_kana { 'タナカ' }
    birthday { '2020-01-01' }
  end
end
