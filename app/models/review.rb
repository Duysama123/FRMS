class Review < ApplicationRecord
  belongs_to :account
  belongs_to :recipe

  # Validate presence
  validates_presence_of :rating

     # Validate numericality for rating
  validates_numericality_of :rating, greater_than_or_equal_to: 1, less_than_or_equal_to: 5
   
     # Validate format for rating to ensure it has one decimal place
  validates_format_of :rating, with: /\A\d+(\.\d{1})?\z/
   
     # Validate presence for comment
  validates_presence_of :comment
   
     # Validate numericality for helpful_count
  validates_numericality_of :helpful_count, only_integer: true, greater_than_or_equal_to: 0
   
     # Set default value for helpful_count
  after_initialize :set_default_helpful_count, if: :new_record?
   
  private
   
  def set_default_helpful_count
     self.helpful_count ||= 0
   end
end
