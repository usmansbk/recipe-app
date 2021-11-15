class InventoryFood < ApplicationRecord
  belongs_to :food
  belongs_to :inventory
  validates :food_id, presence: true, uniqueness: { scope: :inventory_id }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
