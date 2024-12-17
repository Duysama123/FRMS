class RecipeIngredient < ApplicationRecord

  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :cook_method, optional: true # Nếu cook_method không bắt buộc

  has_one_attached :image
  # Validations
  validates :recipe_id, presence: true
  validates :ingredient_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1_000_000 }
  validates :unit, presence: true, inclusion: { 
    in: %w[gram grams kilogram kilograms milliliter milliliters liter liters teaspoon teaspoons tablespoon tablespoons cup cups root roots bundle bundles fruit fruits clove cloves bulb bulbs], 
    message: "%{value} is not a valid unit" 
  }
  

  validates :optional, inclusion: { in: [true, false] }
end
