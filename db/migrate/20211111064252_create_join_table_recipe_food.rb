class CreateJoinTableRecipeFood < ActiveRecord::Migration[6.1]
  def change
    create_join_table :recipes, :foods, table_name: "food_recipes" do |t|
      t.decimal :quantity
      t.index [:recipe_id, :food_id]
    end
  end
end
