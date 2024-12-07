class Recipe < ApplicationRecord
  belongs_to :account
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :steps
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  has_many :reviews
  has_many :shopping_lists
end
