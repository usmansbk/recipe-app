class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, :preparation_time, :cooking_time, :description, :public, presence: true
end
