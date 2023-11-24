class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]

  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipes_url, notice: 'Recipe Added successfully.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    authorize! :destroy, @recipe

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe removed successfully.' }
    end
  end

  def show
    @recipe = current_user.recipes.includes(:recipe_foods).find(params[:id])
    @foods = current_user.foods
    @inventories = Inventory.all.includes(:inventory_foods)
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.public
      @recipe.update(public: false)
      flash.now[:notice] = 'Status changed to private.'
    else
      @recipe.update(public: true)
      flash.now[:notice] = 'Status changed to public'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
