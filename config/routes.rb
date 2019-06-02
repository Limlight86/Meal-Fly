Rails.application.routes.draw do
  devise_for :users

  root 'recipes#index'
  resources :search_results, only: [:index]
  resources :recipes, only: [:index, :show] do
    resources :comments, only: [:index, :create, :destroy]
  end
  resource :cookbook, only: [:show]

  namespace :admin do
    root 'recipes#index'
    resources :recipes
    resources :categories
  end
end
