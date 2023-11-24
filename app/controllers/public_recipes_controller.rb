class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).includes(:recipe_foods)
  end
end
