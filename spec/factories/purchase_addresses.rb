FactoryBot.define do
  factory :purchase_address do
    post_code   { '111-1111'}
    prefecture_id { 2 }
    city  { '岡山市' }
    block { '1-1-1' }
    building { 'ビル' }
    tel { '1234567890' }
  end
end
