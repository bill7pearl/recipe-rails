class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.build
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    food = Food.find_or_create_by(name: recipe_food_params[:food_name])

    if food.persisted?
      @recipe_food = @recipe.recipe_foods.build(food:, quantity: recipe_food_params[:quantity])
      if @recipe_food.save
        redirect_to @recipe, notice: 'Ingredient was successfully added.'
      else
        render :new
      end
    else
      flash[:error] = food.errors.full_messages
      render :new
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_name, :quantity)
  end
end
