Rails.application.routes.draw do
  devise_for :users

  root 'recipes#index'
  resources :search_results, only: [:index]
  resources :recipes, only: [:index, :show]
  resources :user_recipes, only: [:show, :destroy, :index, :create]
  resources :categories, only: [:show]

  namespace :admin do
    root 'recipes#index'
    resources :recipes
    resources :categories
  end
end
