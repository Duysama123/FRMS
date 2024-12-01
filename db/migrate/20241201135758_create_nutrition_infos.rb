class CreateNutritionInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :nutrition_infos do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.decimal :calories
      t.decimal :protein
      t.decimal :carbs
      t.decimal :fat
      t.decimal :sugar
      t.decimal :fiber

      t.timestamps
    end
  end
end
