require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  let(:user) { User.create(name: "John") }
  let(:inventory) { Inventory.create(user: user) }
  let(:food) { Food.create(name: "Cheese") }

  describe "validations" do
    it "should validate the presence of quantity" do
      inventory_food = InventoryFood.new(inventory: inventory, food: food)
      expect(inventory_food).to_not be_valid
      expect(inventory_food.errors[:quantity]).to include("can't be blank")
    end

    it "should validate that quantity is greater than or equal to 0" do
      inventory_food = InventoryFood.new(inventory: inventory, food: food, quantity: -1)
      expect(inventory_food).to_not be_valid
      expect(inventory_food.errors[:quantity]).to include("must be greater than or equal to 0")
    end

    it "should validate the presence of inventory" do
      inventory_food = InventoryFood.new(food: food, quantity: 100)
      expect(inventory_food).to_not be_valid
      expect(inventory_food.errors[:inventory_id]).to include("can't be blank")
    end

    it "should validate the presence of food" do
      inventory_food = InventoryFood.new(inventory: inventory, quantity: 100)
      expect(inventory_food).to_not be_valid
      expect(inventory_food.errors[:food_id]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "should belong to an inventory" do
      expect(InventoryFood.reflect_on_association(:inventory).macro).to eq(:belongs_to)
    end

    it "should belong to a food" do
      expect(InventoryFood.reflect_on_association(:food).macro).to eq(:belongs_to)
    end
  end

  describe "instance methods" do
    it "#quantity should return the quantity" do
      inventory_food = InventoryFood.new(inventory: inventory, quantity: 100)
      expect(inventory_food.quantity).to eq(100)
    end
  end
end
