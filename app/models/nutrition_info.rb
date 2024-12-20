class NutritionInfo < ApplicationRecord
  # Associations
  # NutritionInfo thuộc về một Ingredient (mỗi bản ghi NutritionInfo liên kết với một nguyên liệu)
  belongs_to :ingredient

  # Validate presence of attributes
  # Kiểm tra rằng các trường calories, protein, carbs, fat, sugar, và fiber đều không được để trống
  validates :calories, :protein, :carbs, :fat, :sugar, :fiber, presence: true

  # Validate numericality with a range and format for decimal values
  # Kiểm tra rằng các trường calories, protein, carbs, fat, sugar và fiber có giá trị số hợp lệ trong khoảng từ 0 đến 99999999.99
  # Đồng thời, kiểm tra định dạng giá trị là số thập phân với tối đa 2 chữ số sau dấu phẩy
  validates :calories, :protein, :carbs, :fat, :sugar, :fiber, 
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 99999999.99 },
            format: { with: /\A\d+(\.\d{1,2})?\z/ }

  # Phương thức định dạng giá trị cho các thuộc tính: trả về giá trị nguyên nếu không có phần thập phân
  # Nếu giá trị có phần thập phân, giữ nguyên dưới dạng số thực.
  def formatted_value(attribute)
    value = self[attribute]
    # Nếu giá trị là một số nguyên (không có phần thập phân), trả về dưới dạng số nguyên
    value % 1 == 0 ? value.to_i : value
  end
end

