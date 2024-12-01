require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users

  resources :accounts
  resources :recipes
  resources :ingredients
  resources :recipe_ingredients
  resources :steps
  resources :categories
  resources :recipe_categories
  resources :reviews
  resources :shopping_lists
  resources :nutrition_infos

  # Defines the root path route ("/")
  root "home#index"
end

