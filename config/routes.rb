Rails.application.routes.draw do
  root to: 'foods#index'
  devise_for :users
  resources :foods, only: [:index, :create, :new, :destroy]
  resources :recipes, only: [:index, :show, :create, :new, :destroy] do
    resources :recipe_foods, only: [:new]
  end
  resources :recipe_foods, only: [:edit, :update, :destroy, :create]
  get 'public_recipes', to: 'recipes#public_recipes'
end
