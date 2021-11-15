class AddIdToRecipeFood < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_foods, :id, :primary_key
  end
end
