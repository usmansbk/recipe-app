class InventoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_inventory, only: %i[show destroy]

  # GET /inventories
  def index
    @inventories = current_user.inventories
  end

  # GET /inventories/1
  def show
    @inventory = Inventory.includes(:inventory_foods).find(params[:id])
  end

  def shopping_list
    @inventory = Inventory.includes(:inventory_foods).find(params[:inventory_id])
    @recipe = Recipe.includes(:recipe_foods).find(params[:recipe_id])
    @inventory_foods = InventoryFood.joins(:food, :inventory).where(food: { user: current_user },
                                                                    inventory: { user: current_user })
    @items_count = @inventory_foods.select('food_id').distinct.count
    @total_amount = @inventory_foods.sum('quantity * price')
    @items = @inventory_foods.group('food.name, price, measurement_unit')
      .select('food.name, SUM(quantity) as quantity, (sum(quantity) * price) as price, measurement_unit')
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # POST /inventories
  def create
    @inventory = current_user.inventories.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.fetch(:inventory, {}).permit(:name, :description)
  end
end
