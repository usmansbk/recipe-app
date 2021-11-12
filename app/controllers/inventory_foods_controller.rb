class InventoryFoodsController < ApplicationController
  before_action :set_inventory_food, only: %i[destroy]
  before_action :set_foods, only: %i[new]

  # GET /inventory_foods
  def index
    @inventory_foods = InventoryFood.all
  end

  # GET /inventory_foods/new
  def new
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.new
  end

  # POST /inventory_foods
  def create
    @inventory_food = InventoryFood.new(inventory_food_params)

    respond_to do |format|
      if @inventory_food.save
        format.html do
          redirect_to inventory_path(@inventory_food.inventory),
                      notice: 'Inventory food was successfully created.'
        end
      else
        set_foods
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_foods/1
  def destroy
    @inventory_food.destroy
    respond_to do |format|
      format.html do
        redirect_to inventory_path(@inventory_food.inventory), notice: 'Inventory food was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_foods
    @foods = current_user.foods.map { |food| [food.name, food.id] }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory_food
    @inventory_food = InventoryFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_food_params
    params.fetch(:inventory_food, {}).permit(:quantity, :food_id, :inventory_id)
  end
end
