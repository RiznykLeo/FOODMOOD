Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes, only: [:index, :show] do
    resources :user_recipes, only: [:create]
    resources :shopping_lists, only: [:create]
  end

  resources :user_recipes, only: [:update, :destroy]

  resources :shopping_list, only: [:show, :update]

  get "/cart", to: "user_recipes#cart", as: :cart
  get "/cookbook", to: "user_recipes#cookbook", as: :cookbook
  get "/search", to: "recipes#search", as: :search
  # patch "/shopping_list/:id", to: "shopping_lists#completed"
end
