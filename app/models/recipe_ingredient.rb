class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates_presence_of :quantity, :unit 
  
  validates_numericality_of :quantity, greater_than: 0 
    
  validates_length_of :unit, maximum: 15 
    
  after_initialize :set_default_optional, if: :new_record? 
  private 
  def set_default_optional 
     self.optional ||= false 
   end
end
