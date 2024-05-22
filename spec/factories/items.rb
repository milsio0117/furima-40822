FactoryBot.define do
  factory :item do
    association :user
    title { Faker::Name.name }
    description { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    postage_payer_id { Faker::Number.between(from: 2, to: 3) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 4) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
