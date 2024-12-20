class Ingredient < ApplicationRecord
  # Associations
  # Một Ingredient có thể liên kết với nhiều 'recipe_ingredients' (liên kết giữa nguyên liệu và công thức)
  # Thông qua 'recipe_ingredients', Ingredient có thể liên kết với nhiều recipes (công thức nấu ăn)
  # Một Ingredient có thể có nhiều shopping_lists, cho phép liên kết với nhiều danh sách mua sắm
  # Một Ingredient có thể có một nutrition_info (thông tin dinh dưỡng)
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  has_many :shopping_lists
  has_one :nutrition_info
  # Tài nguyên hình ảnh đính kèm cho Ingredient
  has_one_attached :image
  # Validations
  # Xác thực rằng 'name' không được để trống, có độ dài tối đa là 50 ký tự và phải là duy nhất
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  # Xác thực rằng 'description' không được để trống
  validates :description, presence: true
  # Xác thực tùy chỉnh cho hình ảnh đính kèm
  validate :validate_image
  private

  # Phương thức xác thực tùy chỉnh cho hình ảnh đính kèm
  def validate_image
    # Kiểm tra nếu có hình ảnh đính kèm
    return unless image.attached?

    # Gọi các phương thức để kiểm tra các yêu cầu đối với hình ảnh
    validate_image_size
    validate_image_dimensions
    validate_image_processing
  end

  # Xác thực xử lý hình ảnh: cố gắng phân tích hình ảnh và báo lỗi nếu không thành công
  def validate_image_processing
    begin
      # Phân tích hình ảnh để kiểm tra các thuộc tính như kích thước, loại hình ảnh, v.v.
      image.analyze
    rescue StandardError => e
      # Nếu phân tích hình ảnh gặp lỗi, ghi lại thông báo lỗi và thêm lỗi vào đối tượng image
      Rails.logger.error "Image Analysis Error: #{e.message}"
      errors.add(:image, "could not be analyzed. Ensure it's a valid image file.")
    end
  end

  # Xác thực kích thước hình ảnh (ví dụ: tối đa 5 MB)
  def validate_image_size
    # Nếu kích thước hình ảnh vượt quá 5 MB, thêm lỗi vào đối tượng hình ảnh
    if image.byte_size > 5.megabytes
      errors.add(:image, "is too large. Maximum size allowed is 5 MB.")
    end
  end

  # Xác thực kích thước chiều rộng và chiều cao của hình ảnh (ví dụ: tối đa 2000x2000 pixel)
  def validate_image_dimensions
    # Chỉ kiểm tra nếu hình ảnh đã được phân tích
    return unless image.analyzed?

    # Lấy thông tin chiều rộng và chiều cao của hình ảnh
    dimensions = image.metadata.slice(:width, :height)
    # Nếu không thể xác định chiều rộng và chiều cao, thêm lỗi vào đối tượng image
    if dimensions[:width].nil? || dimensions[:height].nil?
      errors.add(:image, "could not determine dimensions. Please upload a valid image file.")
      return
    end

    # Nếu kích thước chiều rộng hoặc chiều cao vượt quá 2000 pixel, thêm lỗi vào đối tượng image
    if dimensions[:width] > 2000 || dimensions[:height] > 2000
      errors.add(:image, "dimensions are too large. Maximum allowed is 2000x2000 pixels.")
    end
  end
end
