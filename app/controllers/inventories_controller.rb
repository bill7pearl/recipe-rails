class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show destroy]
  before_action :authorize_user, only: [:destroy]

  def index
    @inventories = current_user.inventories.includes(:inventory_foods)
  end

  def show; end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = current_user.inventories.build(inventory_params)
    if @inventory.save
      redirect_to @inventory, notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @inventory.destroy
    puts "Inventory destroyed: #{@inventory.destroyed?}"
    redirect_to inventories_url, notice: 'Inventory was successfully destroyed.'
  end

  private

  def set_inventory
    @inventory = Inventory.includes(:inventory_foods).find(params[:id])
  end

  def authorize_user
    return if current_user == @inventory.user

    redirect_to inventories_path,
                notice: 'Not authorized to perform this action'
  end

  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
