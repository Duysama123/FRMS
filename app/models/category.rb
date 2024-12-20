class Category < ApplicationRecord
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories
  
  validates_presence_of :name
  validates_length_of :name, maximum: 50
end
