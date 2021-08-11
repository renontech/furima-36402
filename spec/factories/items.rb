FactoryBot.define do
  factory :item do
    name              {Faker::Food.fruits}
    description       {Faker::Lorem.sentence}
    category_id       {Faker::Number.within(range: 2..11)}
    condition_id      {Faker::Number.within(range: 2..6)}
    shipping_id       {Faker::Number.within(range: 2..3)}
    prefecture_id     {Faker::Number.within(range: 2..48)}
    ship_day_id       {Faker::Number.within(range: 2..4)}
    price             {Faker::Number.within(range: 300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/wf1000xm4.jpg'), filename: 'wf1000xm4.jpg')
    end
  end
end
