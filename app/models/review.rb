class Review < ApplicationRecord
  belongs_to :account
  belongs_to :recipe

  # Validate presence of rating
  validates :rating, presence: true, 
  numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, format: { with: /\A\d+(\.\d{1})?\z/ }

  # Validate numericality for helpful_count
  validates :helpful_count, numericality: { only_integer: true, greater_than_or_equal_to: 0,less_than_or_equal_to: 5 }

  # Set default value for helpful_count
  after_initialize :set_default_helpful_count, if: :new_record?

  private

  def set_default_helpful_count
    self.helpful_count ||= 0
  end
end

