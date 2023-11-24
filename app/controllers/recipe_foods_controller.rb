class RecipeFoodsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save!
        format.html { redirect_to recipe_path(@recipe), notice: 'Ingredient added successfully.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    authorize! :destroy, @recipe_food
    @recipe_food.destroy!

    respond_to do |format|
      format.html { redirect_to recipe_url, notice: 'Ingredient removed successfully.' }
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_foods).permit(:food_id, :quantity)
  end
end
