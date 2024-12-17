class AddCookMethodToShoppingLists < ActiveRecord::Migration[7.0]
  def change
    add_reference :shopping_lists, :cook_method, null: true, foreign_key: true
  end
end
