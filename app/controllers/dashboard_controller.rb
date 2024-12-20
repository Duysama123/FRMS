class DashboardController < ApplicationController
  def index
    # Gọi job để cập nhật cache
    CacheRecipeDataJob.perform_later

    # Fetch và log dữ liệu từ cache
    Rails.logger.debug("Fetching data for recipes_by_day")
    @recipes_by_day = Rails.cache.fetch("recipes_by_day", expires_in: 5.minutes) do
      result = Recipe.group_by_day(:created_at).count
      Rails.logger.debug("Data fetched for recipes_by_day: #{result.inspect}")
      result
    end
    Rails.logger.debug("Cache for recipes_by_day: #{Rails.cache.read('recipes_by_day').inspect}")

    Rails.logger.debug("Fetching data for recipes_by_method")
    @recipes_by_method = Rails.cache.fetch("recipes_by_method", expires_in: 5.minutes) do
      result = Recipe.group(:cook_method_id).count
      Rails.logger.debug("Data fetched for recipes_by_method: #{result.inspect}")
      result
    end

    Rails.logger.debug("Fetching data for reviews_by_recipe")
    @reviews_by_recipe = Rails.cache.fetch("reviews_by_recipe", expires_in: 5.minutes) do
      result = Review.group(:recipe_id).count
      Rails.logger.debug("Data fetched for reviews_by_recipe: #{result.inspect}")
      result
    end

    Rails.logger.debug("Fetching data for ingredients_usage")
    @ingredients_usage = Rails.cache.fetch("ingredients_usage", expires_in: 5.minutes) do
      result = RecipeIngredient.group(:ingredient_id).count
      Rails.logger.debug("Data fetched for ingredients_usage: #{result.inspect}")
      result
    end

    Rails.logger.debug("Fetching data for shopping_list_status")
    @shopping_list_status = Rails.cache.fetch("shopping_list_status", expires_in: 5.minutes) do
      result = ShoppingList.group(:purchased).count
      Rails.logger.debug("Data fetched for shopping_list_status: #{result.inspect}")
      result
    end
  end

  # API riêng cho từng biểu đồ
  def recipes_by_day
    data = Rails.cache.fetch("recipes_by_day", expires_in: 5.minutes) do
      Recipe.group_by_day(:created_at).count
    end
    render json: data
  end

  def recipes_by_method
    data = Rails.cache.fetch("recipes_by_method", expires_in: 5.minutes) do
      Recipe.group(:cook_method_id).count
    end
    render json: data
  end

  def reviews_by_recipe
    data = Rails.cache.fetch("reviews_by_recipe", expires_in: 5.minutes) do
      Review.group(:recipe_id).count
    end
    render json: data
  end

  def ingredients_usage
    data = Rails.cache.fetch("ingredients_usage", expires_in: 5.minutes) do
      RecipeIngredient.group(:ingredient_id).count
    end
    render json: data
  end

  def shopping_list_status
    data = Rails.cache.fetch("shopping_list_status", expires_in: 5.minutes) do
      ShoppingList.group(:purchased).count
    end
    render json: data
  end
end
