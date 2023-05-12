class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @recipes = Recipe.where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @inventories = current_user.inventories
    @ingredients = @recipe&.recipe_foods
  end

  def new
    @current_user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe
  end

  def my_recipes
    @recipes = current_user.recipes
  end

  def generate_list
    redirect_to shopping_list_path(params[:recipe_id])
  end

  def shopping_list
    @quantity = []
    @foods = []

    recipe_foods = RecipeFood.where(recipe_id: params[:recipe_id])
    inventory = Inventory.find(params[:inventory_id]) # Assuming inventory_id is passed in params

    recipe_foods.each do |recipe_food|
      food = recipe_food.food
      inventory_food = inventory.inventory_foods.find_by(food_id: food.id)

      next unless inventory_food.nil? || inventory_food.quantity < recipe_food.quantity

      missing_quantity = inventory_food.nil? ? recipe_food.quantity : recipe_food.quantity - inventory_food.quantity
      @foods << food.name
      @quantity << [missing_quantity, food.price]
    end

    @total = 0
    @quantity.each do |q|
      @total += q[0].to_i * q[1].to_i
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation, :cooking_time, :description, :public)
  end
end
