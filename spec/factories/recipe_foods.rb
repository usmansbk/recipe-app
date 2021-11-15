FactoryBot.define do
  factory :recipe_food do
    quantity { 2 }
    recipe
    food
  end
end
