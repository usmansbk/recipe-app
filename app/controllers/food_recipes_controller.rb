class FoodRecipesController < ApplicationController
  before_action :set_food_recipe, only: %i[update destroy]

  # GET /food_recipes/new
  def new
    @food_recipe = FoodRecipe.new
  end

  # POST /food_recipes
  def create
    @food_recipe = FoodRecipe.new(food_recipe_params)

    respond_to do |format|
      if @food_recipe.save
        format.html { redirect_to @food_recipe, notice: 'Food recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_recipes/1
  def update
    respond_to do |format|
      if @food_recipe.update(food_recipe_params)
        format.html { redirect_to @food_recipe, notice: 'Food recipe was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_recipes/1
  def destroy
    @food_recipe.destroy
    respond_to do |format|
      format.html { redirect_to food_recipes_url, notice: 'Food recipe was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food_recipe
    @food_recipe = FoodRecipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_recipe_params
    params.fetch(:food_recipe, {}).permit(:quantity)
  end
end
