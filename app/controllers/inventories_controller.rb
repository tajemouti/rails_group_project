class InventoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @inventories = Inventory.all
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = current_user.inventories.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventories_path, notice: 'Inventory created successfully.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    authorize! :destroy, @inventory
    @inventory.destroy!

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory removed successfully.' }
    end
  end

  def show
    @inventory = Inventory.find(params[:id])
    @foods = @inventory.inventory_foods.includes(:food)
    @foody = Food.all
    @inventory_food = InventoryFood.new
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
