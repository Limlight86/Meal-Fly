Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
=======
  get 'hello_world', to: 'hello_world#index'
  root  'results#index'
  get   'search' => 'results#index'
>>>>>>> search bar

  root 'recipes#index'
  resources :recipes, only: [:index, :show]
  resource :cookbook, only: [:show]

  namespace :admin do
    root 'recipes#index'
    resources :recipes
    resources :categories
  end
end
