class NutritionInfo < ApplicationRecord
  belongs_to :ingredient

  validates_presence_of :calories, :protein, :carbs, :fat, :sugar, :fiber
  validates_numericality_of :calories, :protein, :carbs, :fat, :sugar, :fiber, greater_than_or_equal_to: 0, less_than_or_equal_to: 99999999.99
  validates_format_of :calories, :protein, :carbs, :fat, :sugar, :fiber, with: /\A\d+(\.\d{1,2})?\z/
end
