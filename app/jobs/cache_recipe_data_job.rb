class CacheRecipeDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.cache.write("recipes_by_day", Recipe.group_by_day(:created_at).count, expires_in: 5.minutes)
    Rails.cache.write("recipes_by_method", Recipe.group(:cook_method_id).count, expires_in: 5.minutes)
    Rails.cache.write("reviews_by_recipe", Review.group(:recipe_id).count, expires_in: 5.minutes)
    Rails.cache.write("ingredients_usage", RecipeIngredient.group(:ingredient_id).count, expires_in: 5.minutes)
    Rails.cache.write("shopping_list_status", ShoppingList.group(:purchased).count, expires_in: 5.minutes)
  end
end
