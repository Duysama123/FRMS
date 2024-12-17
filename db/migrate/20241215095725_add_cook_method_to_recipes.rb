class AddCookMethodToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :cook_method, null: true, foreign_key: true
  end
end
