require 'sidekiq/web'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Chỉ cho phép người dùng admin truy cập vào Sidekiq
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # Yêu cầu người dùng đăng nhập trước khi truy cập vào các resource
  authenticate :user do
    resources :accounts

    resources :recipes do
      get 'show_steps', to: 'steps#show_steps', as: 'show_steps'
      get 'show_ingredients', to: 'recipe_ingredients#show_ingredients', as: 'show_ingredients'
    end

    resources :ingredients
    resources :recipe_ingredients
    resources :steps
    resources :categories
    resources :recipe_categories
    resources :reviews
    resources :shopping_lists
    get '/full_list', to: 'full_list#show', as: 'full_list'

    resources :nutrition_infos
    resources :cook_methods
      get 'dashboard', to: 'dashboard#index'
    get '/dashboard/data', to: 'dashboard#data'
    # Định nghĩa các route cho API
  get '/dashboard/recipes_by_day', to: 'dashboard#recipes_by_day'
  get '/dashboard/recipes_by_method', to: 'dashboard#recipes_by_method'
  get '/dashboard/reviews_by_recipe', to: 'dashboard#reviews_by_recipe'
  get '/dashboard/ingredients_usage', to: 'dashboard#ingredients_usage'
  get '/dashboard/shopping_list_status', to: 'dashboard#shopping_list_status'
  end

  devise_for :users

  # Defines the root path route ("/")
  root "home#index"
end
