class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end
