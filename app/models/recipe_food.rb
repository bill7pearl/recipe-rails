class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  attr_accessor :food_name # Define virtual attribute

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :value, presence: true
  validates :recipe_id, presence: true
  validates :food_name, presence: true # Add validation for food_name

  before_validation :set_food_from_name # Set food association based on food_name

  private

  def set_food_from_name
    self.food = Food.find_by(name: food_name)
  end
end
