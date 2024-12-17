class AddCookMethodIdToRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_ingredients, :cook_method_id, :integer
    add_foreign_key :recipe_ingredients, :cook_methods
    add_index :recipe_ingredients, :cook_method_id
  end
end
