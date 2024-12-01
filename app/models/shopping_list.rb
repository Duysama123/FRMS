class ShoppingList < ApplicationRecord
  belongs_to :account
  belongs_to :recipe
  belongs_to :ingredient
end
