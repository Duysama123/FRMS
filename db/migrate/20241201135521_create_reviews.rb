class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :account, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.decimal :rating, precision: 2, scale: 1
      t.text :comment
      t.integer :helpful_count, default: 0

      t.timestamps
    end
  end
end
