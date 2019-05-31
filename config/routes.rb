Rails.application.routes.draw do
  devise_for :users

  root 'recipes#index'

  namespace :admin do
    root 'recipes#index'
    resources :recipes
    resources :categories
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
