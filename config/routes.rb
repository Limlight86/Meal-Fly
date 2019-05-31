Rails.application.routes.draw do
  devise_for :users

  root 'recipes#index'
  resources :recipes, only: [:index, :show]
  resource :cookbook, only: [:show]

  namespace :admin do
    root 'recipes#index'
    resources :recipes
    resources :categories
  end
end
