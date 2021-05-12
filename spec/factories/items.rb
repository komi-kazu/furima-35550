FactoryBot.define do
  factory :item do
    name                {Faker::Name.name}
    explain             {Faker::Lorem.sentence}
    category_id         {2}
    condition_id        {2}
    delivery_fee_id     {2}
    prefecture_id       {2}
    sending_days_id     {2}
    selling_price       {1000}
    association :user
  end
end
