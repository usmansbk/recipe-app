Rails.application.routes.draw do
  root to: 'foods#index'
  devise_for :users
  resources :foods, only: [:index, :create, :new, :destroy]
  resources :recipes, only: [:index, :show, :create, :new, :destroy] do
    resources :recipe_foods, only: [:new]
  end
  resources :recipe_foods, only: [:edit, :update, :destroy, :create]
  resources :inventories, only: [:index, :create, :new, :destroy]

  get 'public_recipes', to: 'recipes#public_recipes'
  get 'general_shopping_list', to: 'users#show'
end
