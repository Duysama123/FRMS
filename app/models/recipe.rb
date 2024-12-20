class Recipe < ApplicationRecord
  # Associations
  # Mỗi Recipe thuộc về một tài khoản (account), tức là mỗi công thức sẽ gắn liền với một người dùng
  belongs_to :account

  # Một công thức có nhiều ingredients qua mối quan hệ many-to-many với recipe_ingredients
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  # Một công thức có nhiều categories thông qua bảng trung gian recipe_categories
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories

  # Mỗi công thức có nhiều reviews
  has_many :reviews

  # Mỗi công thức có nhiều shopping lists
  has_many :shopping_lists

  # Một công thức có nhiều steps, và các bước này sẽ bị xóa khi công thức bị xóa
  has_many :steps, dependent: :destroy

  # Một công thức thuộc về một cook_method (phương pháp nấu ăn)
  belongs_to :cook_method
  
  # Công thức có thể đính kèm một hình ảnh và một video
  has_one_attached :image
  has_one_attached :video

  # Validations
  # Kiểm tra các trường title, description, instruction, prep_time, cook_time và servings không được để trống
  validates :title, :description, :instruction, :prep_time, :cook_time, :servings, presence: true

  # Kiểm tra chiều dài của trường title không vượt quá 255 ký tự
  validates :title, length: { maximum: 255 }

  # Kiểm tra các trường prep_time, cook_time và servings là số nguyên dương
  validates :prep_time, :cook_time, :servings, numericality: { only_integer: true, greater_than: 0 }

  # Scope để tìm kiếm công thức theo tiêu đề (title)
  # Sử dụng ILIKE để tìm kiếm không phân biệt chữ hoa chữ thường
  scope :search_by_title, ->(query) {
    where("title ILIKE ?", "%#{query}%") if query.present?
  }
end
