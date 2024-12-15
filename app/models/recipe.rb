class Recipe < ApplicationRecord
  belongs_to :account
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :steps
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  has_many :reviews
  has_many :shopping_lists

  has_one_attached :image
  has_one_attached :video
  
  validates :title, :description, :instruction, :prep_time, :cook_time, :servings, presence: true
  validates :title, length: { maximum: 255 }
  validates :prep_time, :cook_time, :servings, numericality: { only_integer: true, greater_than: 0 }
end
