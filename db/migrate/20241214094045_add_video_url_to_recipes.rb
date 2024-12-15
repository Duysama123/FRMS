class AddVideoUrlToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :video_url, :string
  end
end
