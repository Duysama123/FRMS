class ShoppingList < ApplicationRecord
  belongs_to :account
  belongs_to :recipe
  belongs_to :ingredient

  validates_presence_of :quantity, :unit 
  
  validates_numericality_of :quantity, greater_than: 0 
  
  validates_length_of :unit, maximum: 15 
 
  after_initialize :set_default_purchased, if: :new_record? 
  private 
  def set_default_purchased 
    self.purchased ||= false 
  end
end
