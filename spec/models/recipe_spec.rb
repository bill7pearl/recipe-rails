require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: "Test User") }

  describe "validations" do
    it "is valid with a name and cooking_time" do
      recipe = Recipe.new(name: "Spaghetti Bolognese", cooking_time: 30, user: user)
      expect(recipe).to be_valid
    end

    it "is invalid without a name" do
      recipe = Recipe.new(name: nil, cooking_time: 30, user: user)
      expect(recipe).to be_invalid
      expect(recipe.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a cooking_time" do
      recipe = Recipe.new(name: "Spaghetti Bolognese", cooking_time: nil, user: user)
      expect(recipe).to be_invalid
      expect(recipe.errors[:cooking_time]).to include("can't be blank")
    end
  end

  describe "scopes" do
    let(:user) { User.create(email: "john@example.com", password: "password") }
    let(:public_recipe) { Recipe.create(name: "Public Recipe", cooking_time: 30, public: true, user: user) }
    let!(:private_recipe) { Recipe.create(name: "Private Recipe", cooking_time: 30, public: false, user: user) }

    it "returns public recipes" do
      expect(Recipe.public_recipes).to eq [public_recipe]
    end
  end
end
