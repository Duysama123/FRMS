class AddMethodAndImageToShoppingLists < ActiveRecord::Migration[7.0]
  def change
    add_column :shopping_lists, :method, :string
    add_column :shopping_lists, :image, :string
  end
end
