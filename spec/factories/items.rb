FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    text { Faker::Lorem.sentence }
    price { rand(300..9999999) }
    association :user
    association :category
    association :condition
    association :delivery_charge
    association :prefecture
    association :handling_time

    after(:build) do |picture|
      picture.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
