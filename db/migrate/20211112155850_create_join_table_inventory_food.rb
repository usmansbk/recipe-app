class CreateJoinTableInventoryFood < ActiveRecord::Migration[6.1]
  def change
    create_join_table :inventories, :foods do |t|
      t.index [:inventory_id, :food_id]
      # t.index [:food_id, :inventory_id]
    end
  end
end
