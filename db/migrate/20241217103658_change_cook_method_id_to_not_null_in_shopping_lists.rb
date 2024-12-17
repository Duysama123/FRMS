class ChangeCookMethodIdToNotNullInShoppingLists < ActiveRecord::Migration[7.0]
  def up
    # Update all shopping lists with a NULL cook_method_id to a valid cook_method_id (e.g., with ID 1)
    ShoppingList.where(cook_method_id: nil).update_all(cook_method_id: 1) # Assuming cook_method with ID 1 is valid

    # Now, alter the column to NOT NULL
    change_column_null :shopping_lists, :cook_method_id, false
  end

  def down
    # Optionally, make the column nullable again in case of rollback
    change_column_null :shopping_lists, :cook_method_id, true
  end
end
