class CookMethod < ApplicationRecord
  has_many :steps
  has_many :recipes
  has_many :shopping_lists 
end
