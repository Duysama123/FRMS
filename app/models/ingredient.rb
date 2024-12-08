class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :shopping_lists
  has_one :nutrition_info

  has_one_attached: image
  validates_presence_of :name, :description 
   
  validates_length_of :name, maximum: 50
end
