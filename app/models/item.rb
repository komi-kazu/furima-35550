class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sending_days

  with_options presence: true do
    validates :name
    validates :explain
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :delivery_fee_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :sending_days_id, numericality: { other_than: 1 } 
    validates :selling_price, inclusion: { in: 300..9999999 }
    validates :image
  end
  
end
