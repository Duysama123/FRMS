class Ingredient < ApplicationRecord
  # Associations
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :shopping_lists
  has_one :nutrition_info

  # Validations
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :description, presence: true
end
