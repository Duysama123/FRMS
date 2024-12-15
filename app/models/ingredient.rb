class Ingredient < ApplicationRecord
  # Associations
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :shopping_lists
  has_one :nutrition_info

  has_one_attached :image

  # Validations
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :description, presence: true
  validate :validate_image

  private

  def validate_image
    return unless image.attached?

    validate_image_size
    validate_image_dimensions
    validate_image_processing
  end

  def validate_image_processing
    begin
      image.analyze
    rescue StandardError => e
      Rails.logger.error "Image Analysis Error: #{e.message}"
      errors.add(:image, "could not be analyzed. Ensure it's a valid image file.")
    end
  end

  # Validate image file size (e.g., max 5 MB)
  def validate_image_size
    if image.byte_size > 5.megabytes
      errors.add(:image, "is too large. Maximum size allowed is 5 MB.")
    end
  end

  # Validate image dimensions (e.g., max 2000x2000 pixels)
  def validate_image_dimensions
    return unless image.analyzed?
  
    dimensions = image.metadata.slice(:width, :height)
    if dimensions[:width].nil? || dimensions[:height].nil?
      errors.add(:image, "could not determine dimensions. Please upload a valid image file.")
      return
    end
  
    if dimensions[:width] > 2000 || dimensions[:height] > 2000
      errors.add(:image, "dimensions are too large. Maximum allowed is 2000x2000 pixels.")
    end
  end
  
end
