class CreateJoinTableInventoryFood < ActiveRecord::Migration[6.1]
  def change
    create_join_table :inventories, :foods, table_name: "inventory_foods" do |t|
      t.primary_key :id
      t.integer :quantity
      t.index [:inventory_id, :food_id]
    end
  end
end
