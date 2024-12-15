class Step < ApplicationRecord
  belongs_to :recipe
  has_one_attached :image
 

  # Validate position and instruction
  validates :position, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :instruction, presence: true
  validates :name, presence: true # Thêm validation cho trường name nếu cần

  # Kiểm tra nếu ảnh đã được đính kèm
  validates :image, presence: true, if: -> { image.attached? }
  # Validate ảnh có loại tệp đúng (bao gồm .webp) và kích thước nhỏ hơn 5MB
  validate :correct_image_content_type
  validate :correct_image_size

  private

  def correct_image_content_type
    if image.attached? && !image.content_type.in?(%('image/png image/jpg image/jpeg image/gif image/webp'))
      errors.add(:image, 'must be a PNG, JPG, JPEG, GIF, or WebP')
    end
  end

  def correct_image_size
    if image.attached? && image.byte_size > 5.megabytes
      errors.add(:image, 'should be less than 5MB')
    end
  end
 
end
