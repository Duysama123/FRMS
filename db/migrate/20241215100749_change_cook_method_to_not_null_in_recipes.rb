class ChangeCookMethodToNotNullInRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column_null :recipes, :cook_method_id, false
  end
end
