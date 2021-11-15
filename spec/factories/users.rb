FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  sequence :name do |n|
    "John Doe #{n}"
  end

  factory :user do
    name
    email
    password { 'secret_token' }

    factory :user_with_recipes do
      recipes do
        Array.new(5) { association(:recipe) }
      end
    end

    factory :user_with_foods do
      foods do
        Array.new(5) { association(:food) }
      end
    end
  end
end
