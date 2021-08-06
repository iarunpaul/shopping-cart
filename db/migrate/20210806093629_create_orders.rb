class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :grand_total
      t.decimal :sub_total

      t.timestamps
    end
  end
end
