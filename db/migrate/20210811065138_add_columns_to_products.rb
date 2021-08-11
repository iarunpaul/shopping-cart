class AddColumnsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :category_id, :integer
    add_column :products, :released_at, :date
  end
end
