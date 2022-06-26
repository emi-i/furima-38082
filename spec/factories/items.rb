FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    content { Faker::Lorem.sentence }
    category_id { '2' }
    status_id { '2' }
    defrayment_id { '2' }
    prefecture_id { '2' }
    ship_date_id { '2' }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
