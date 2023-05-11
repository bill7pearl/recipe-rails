class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :inventory_id, presence: true
  validates :food_id, presence: true
end
