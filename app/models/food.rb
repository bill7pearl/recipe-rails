class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods, source: :recipe
  has_many :inventory_foods

  attribute :measurement_unit, :string
  attribute :price, :decimal, precision: 8, scale: 2

  validates :name, presence: true, length: { maximum: 50 }
end
