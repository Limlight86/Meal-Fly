Rails.application.routes.draw do
  root 'recipes#index'
  devise_for :users
  resources :recipes
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
