class AddIdToInventoryFood < ActiveRecord::Migration[6.1]
  def change
    add_column :foods_inventories, :id, :primary_key
  end
end
