class ItemsController < ApplicationController
  load_and_authorize_resource
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show; end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit; end

  # POST /items or /items.json
  def create
    @item = current_user.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.fetch(:item, {}).permit(:name, :price)
  end
end
