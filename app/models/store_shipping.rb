class StoreShipping
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal,:prefecture_id,:municipality,:address,:building_name,:phone_number,:store_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number, numericality: {only_integer: true}, length: { in: 1..11 }
    validates :store_id
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    store = Store.create(user_id: user_id, item_id: item_id)

    shipping = Shipping.create(postal: postal, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, store_id: store.id)
  end
end