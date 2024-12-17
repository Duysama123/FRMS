require 'sidekiq/web'
Rails.application.routes.draw do
  # Bảo vệ route `/sidekiq` chỉ dành cho admin
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
   

  devise_for :users

  resources :accounts
  
  resources :recipes do
    resources :steps # Chỉ cho phép các bước cho từng món ăn
    get 'show_steps', to: 'steps#show_steps', as: 'show_steps'

    # Nested resource for recipe_ingredients
    resources :recipe_ingredients  # You can add other actions if needed, e.g. create, show, etc.
    get 'show_ingredients', to: 'recipe_ingredients#show_ingredients', as: 'show_ingredients' # Custom route for the ingredients page
  end

  resources :ingredients 
  resources :recipe_ingredients 
  resources :steps  # Đảm bảo bạn có route cho steps chung (không có recipe_id)
  resources :categories
  resources :recipe_categories
  resources :reviews
  resources :shopping_lists
  resources :nutrition_infos
  resources :cook_methods

  # Defines the root path route ("/")
  root "home#index"
end
