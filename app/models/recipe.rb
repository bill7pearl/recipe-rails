class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, source: :food

  scope :public_recipes, -> { where(public: true) }

  validates :name, presence: true
  validates :cooking_time, presence: true

  def total_price
    foods.map { |f| f.price.to_i * f.recipe_foods.find_by(recipe_id: id).quantity.to_i }.sum
  end
end
