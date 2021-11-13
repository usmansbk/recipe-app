class RecipesController < ApplicationController
  load_and_authorize_resource except: :public_recipes
  before_action :set_recipe, only: %i[show destroy]

  # GET /recipes
  def index
    @recipes = current_user.recipes.all
  end

  # GET /public_recipes
  def public_recipes
    @recipes = Recipe.includes(:user, :recipe_foods).where({ public: true }).order(created_at: :desc)
  end

  # GET /recipes/1
  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    set_inventories
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes
  def create
    @recipe = current_user.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
    end
  end

  private

  def set_inventories
    @inventories = current_user.inventories.map { |inventory| [inventory.name, inventory.id] }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.fetch(:recipe, {}).permit(:name, :cooking_time, :preparation_time, :public, :description)
  end
end
