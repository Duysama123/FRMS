class CreateShoppingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_lists do |t|
      t.references :account, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :quantity, precision: 10, scale: 2, null: false
      t.string :unit, null: false
      t.boolean :purchased, default: false

      t.timestamps
    end
  end
end