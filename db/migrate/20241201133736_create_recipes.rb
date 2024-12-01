class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :instruction
      t.integer :prep_time
      t.integer :cook_time
      t.integer :servings
      t.references :account, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
