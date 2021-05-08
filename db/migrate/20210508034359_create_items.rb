class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps

      t.string :name, null: false
      t.text :explain, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee, null: false
      t.integer :prefecture_id, null: false
      t.integer :sending_days, null: false
      t.integer :selling_price, null: false
      t.references :user, null: false, foreign_key: true
    end
  end
end
