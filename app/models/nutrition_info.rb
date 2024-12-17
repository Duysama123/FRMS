class NutritionInfo < ApplicationRecord
  belongs_to :ingredient

  # Validate presence of attributes
  validates :calories, :protein, :carbs, :fat, :sugar, :fiber, presence: true

  # Validate numericality with a range and format for decimal values
  validates :calories, :protein, :carbs, :fat, :sugar, :fiber, 
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 99999999.99 },
            format: { with: /\A\d+(\.\d{1,2})?\z/ }
  def formatted_value(attribute)
    value = self[attribute]
    value % 1 == 0 ? value.to_i : value
  end
end
