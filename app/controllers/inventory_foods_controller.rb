class InventoryFoodsController < ApplicationController
  before_action :set_inventory_food, only: %i[destroy]

  # GET /inventory_foods or /inventory_foods.json
  def index
    @inventory_foods = InventoryFood.all
  end

  # GET /inventory_foods/new
  def new
    @inventory_food = InventoryFood.new
  end

  # POST /inventory_foods
  def create
    @inventory_food = InventoryFood.new(inventory_food_params)

    respond_to do |format|
      if @inventory_food.save
        format.html { redirect_to @inventory_food, notice: 'Inventory food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_foods/1
  def destroy
    @inventory_food.destroy
    respond_to do |format|
      format.html { redirect_to inventory_foods_url, notice: 'Inventory food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory_food
    @inventory_food = InventoryFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_food_params
    params.fetch(:inventory_food, {})
  end
end
