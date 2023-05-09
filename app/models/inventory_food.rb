class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
