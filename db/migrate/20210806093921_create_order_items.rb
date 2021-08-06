class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :order_id
      t.decimal :unit_price
      t.integer :quantity
      t.decimal :total

      t.timestamps
    end
  end
end
