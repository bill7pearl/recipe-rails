class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.public_recipes.order(created_at: :desc)
    @recipe_ingredients = RecipeFood.all
  end

  def show
    @recipe = Recipe.public_recipes.find(params[:id])
    @ingredients = @recipe&.recipe_foods
  end
end
