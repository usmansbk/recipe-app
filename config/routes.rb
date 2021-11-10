Rails.application.routes.draw do
  root to: 'foods#index'
  devise_for :users
  resources :foods
end
