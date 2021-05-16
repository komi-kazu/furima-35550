FactoryBot.define do
  factory :store_shipping do
    postal                    { '123-4567' }
    prefecture_id             { 2 }
    municipality              { 'さいたま市' }
    address                   { '大宮区土手町' }
    building_name             { 'アーバンハイツ' }
    phone_number              { '08000000000' }

  end
end
