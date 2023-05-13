class InventoryFoodsController < ApplicationController
  before_action :set_inventory, only: %i[new create]

  def new
    @inventory_food = @inventory.inventory_foods.build
    @foods = Food.all # assuming you have a Food model
  end

  def create
    @inventory_food = @inventory.inventory_foods.create(inventory_food_params)
    if @inventory_food.save
      redirect_to @inventory
    else
      @foods = Food.all
      render 'new'
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    redirect_to inventory_path(@inventory_food.inventory), notice: 'Food was successfully removed from the inventory.'
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:food_id, :quantity)
  end
end
