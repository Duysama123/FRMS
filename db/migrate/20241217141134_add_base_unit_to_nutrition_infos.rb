class AddBaseUnitToNutritionInfos < ActiveRecord::Migration[7.0]
  def change
    add_column :nutrition_infos, :base_unit, :string
  end
end
