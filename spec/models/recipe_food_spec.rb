require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
    let(:recipe) { Recipe.create(name: "Pizza") }
    let(:food) { Food.create(name: "Cheese") }

    describe "validations" do
      it "should validate the presence of quantity" do
        recipe_food = RecipeFood.new(recipe: recipe, food: food)
        expect(recipe_food).to_not be_valid
        expect(recipe_food.errors[:quantity]).to include("is not a number")
      end
  
      it "should validate that quantity is greater than 0" do
        recipe_food = RecipeFood.new(recipe: recipe, food: food, quantity: 0)
        expect(recipe_food).to_not be_valid
        expect(recipe_food.errors[:quantity]).to include("must be greater than 0")
      end
    end
  
    describe "instance methods" do
      it "#quantity should return the quantity" do
        recipe_food = RecipeFood.new(food: food, quantity: 100)
        expect(recipe_food.quantity).to eq(100)
      end
    end
  end
  