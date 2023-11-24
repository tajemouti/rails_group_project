class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: :recipe_id, dependent: :destroy

  validates :name, :preparation_time, :cooking_time, :description, presence: true

  def self.calculate_total_amount(recipe)
    total_amount = 0
    recipe.recipe_foods.each do |recipe_food|
      food = recipe_food.food
      total_amount += recipe_food.quantity * food.price
    end
    total_amount
  end
end
