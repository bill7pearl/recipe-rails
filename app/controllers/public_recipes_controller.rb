class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.public_recipes.order(created_at: :desc)
  end

  def show
    @recipe = Recipe.public_recipes.find(params[:id])
  end
end
