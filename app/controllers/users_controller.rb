class UsersController < ApplicationController
  def show
    @foods = []
    @recipe_foods = RecipeFood.joins(:food, :recipe).where(food: { user: current_user }, recipe: { user: current_user })
    @items_count = @recipe_foods.count
    @total_amount = @recipe_foods.sum('quantity * price')
  end
end
