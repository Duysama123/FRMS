class CreateRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :quantity, precision: 10, scale: 2, null: false
      t.string :unit, null: false
      t.boolean :optional, default: false # Thêm default: false ở đây
      t.timestamps
    end
  end
end
