FactoryBot.define do
  factory :item_order do
    postal_code   { '123-4567' }
    prefecture_id { 4 }
    city          { '港区' }
    house_number  { '阿佐ヶ谷' }
    building      { 'むつみ荘' }
    phone_number  { '08012345678' }
    token         { 'tok_626f1afab9e448d9235f527d49d4' }
  end
end
