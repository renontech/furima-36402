FactoryBot.define do
  factory :buy_record_buyer do
    postcode        {'123-4567'}
    prefecture_id   {Faker::Number.within(range: 2..48)}
    city            {Faker::Address.city}
    block           {Faker::Address.street_name}
    building        {Faker::Address.building_number}
    phone_number    {'09012345678'}
    token           {'tok_abcdefghijk00000000000000000'}
  end
end
