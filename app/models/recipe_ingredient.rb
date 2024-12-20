class RecipeIngredient < ApplicationRecord
  # Callback trước khi lưu (before_save) để làm tròn giá trị quantity nếu nó là số nguyên
  before_save :round_quantity

  # Associations
  # Mỗi RecipeIngredient thuộc về một công thức (recipe) và một nguyên liệu (ingredient)
  belongs_to :recipe
  belongs_to :ingredient
  # Mỗi RecipeIngredient có thể có một phương pháp nấu ăn (cook_method), nhưng không bắt buộc
  belongs_to :cook_method, optional: true 

  # Tài nguyên hình ảnh đính kèm cho RecipeIngredient
  has_one_attached :image

  # Validations
  # Xác thực rằng recipe_id và ingredient_id không được để trống
  validates :recipe_id, presence: true
  validates :ingredient_id, presence: true

  # Xác thực rằng quantity phải có giá trị và là một số hợp lệ trong khoảng từ 0 đến 1 triệu
  validates :quantity, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1_000_000 }

  # Xác thực rằng unit phải có giá trị hợp lệ (từ điển các đơn vị đo lường)
  validates :unit, presence: true, inclusion: { 
    in: %w[gram grams kilogram kilograms milliliter milliliters liter liters teaspoon teaspoons tablespoon tablespoons cup cups root roots bundle bundles fruit fruits clove cloves bulb bulbs], 
    message: "%{value} is not a valid unit" 
  }

  # Xác thực rằng thuộc tính optional phải là true hoặc false
  validates :optional, inclusion: { in: [true, false] }

  # Phương thức callback để làm tròn giá trị quantity nếu nó là số nguyên
  def round_quantity
    self.quantity = quantity.to_i if quantity.to_f == quantity.to_i
  end
end
