FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.name }
    email                   { Faker::Internet.free_email }
    password                { 'password1' }
    password_confirmation   { password }
    last_name               { '田中' }
    first_name              { '太郎' }
    last_name_kana          { 'タナカ' }
    first_name_kana         { 'タロウ' }
    birthday                { Faker::Date.birthday }
  end
end
