class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  validates :food_id, presence: true, uniqueness: { scope: :recipe_id }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
