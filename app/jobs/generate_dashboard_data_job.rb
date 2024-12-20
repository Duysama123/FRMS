class GenerateDashboardDataJob < ApplicationJob
  queue_as :default

  def perform
    # Tính toán dữ liệu và lưu vào cache
    @recipes_by_day = Recipe.group_by_day(:created_at).count
    @recipes_by_method = Recipe.group(:cook_method_id).count
    @reviews_by_recipe = Review.group(:recipe_id).count
    @ingredients_usage = RecipeIngredient.group(:ingredient_id).count
    @shopping_list_status = ShoppingList.group(:purchased).count

      # Gọi background job để tính toán dữ liệu
      GenerateDashboardDataJob.perform_later
    # Lưu vào cache
    Rails.cache.write("recipes_by_day", @recipes_by_day)
    Rails.cache.write("recipes_by_method", @recipes_by_method)
    Rails.cache.write("reviews_by_recipe", @reviews_by_recipe)
    Rails.cache.write("ingredients_usage", @ingredients_usage)
    Rails.cache.write("shopping_list_status", @shopping_list_status)
  end
  
end