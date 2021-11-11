class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_recipes

  validates :name, :preparation_time, :cooking_time, :description, presence: true
end
