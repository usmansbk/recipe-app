class AddDescriptionToInventory < ActiveRecord::Migration[6.1]
  def change
    add_column :inventories, :description, :text
  end
end
