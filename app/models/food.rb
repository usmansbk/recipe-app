class Food < ApplicationRecord
  belongs_to :user

  validates :name, :measurement_unit, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
