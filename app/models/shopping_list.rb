class ShoppingList < ApplicationRecord
  belongs_to :account
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :cook_method,optional: true
 

  has_one_attached :photo
  # Validate presence of quantity and unit
  validates :quantity, :unit, presence: true

  # Validate numericality of quantity (greater than 0)
  validates :quantity, numericality: { greater_than: 0 }

  # Validate length of unit (maximum length 15 characters)
  validates :unit, length: { maximum: 15 }

  # Set default value for purchased if it's a new record
  after_initialize :set_default_purchased, if: :new_record?

  private

  def set_default_purchased
    self.purchased ||= false
  end
end
