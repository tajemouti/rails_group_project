class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])
    @shopping_list = @inventory.calculate_foods(@recipe)
  end
end
