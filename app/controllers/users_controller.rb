class UsersController < ApplicationController
  def show
    @recipe_foods = RecipeFood.joins(:food, :recipe).where(food: { user: current_user }, recipe: { user: current_user })
    @items_count = @recipe_foods.select('food_id').distinct.count
    @total_amount = @recipe_foods.sum('quantity * price')
    @items = @recipe_foods.group('food.name, price, measurement_unit')
      .select('food.name, SUM(quantity) as quantity, (sum(quantity) * price) as price, measurement_unit')
  end
end
