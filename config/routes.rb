Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes, only: [:index, :show] do
    resources :user_recipes, only: [:create]
    resources :shopping_ingredients, only: [:create]
  end

  resources :user_recipes, only: [:update, :destroy]

  resources :shopping_lists, only: :update

  resources :ingredients, only: :update

  resources :shopping_ingredients, only: [:update]

  get "/cart", to: "user_recipes#cart", as: :cart
  get "/cookbook", to: "user_recipes#cookbook", as: :cookbook
  get "/list", to: "shopping_lists#show", as: :list
  get "/search", to: "recipes#search", as: :search
end
