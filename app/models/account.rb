class Account < ApplicationRecord
  # Account có nhiều recipes, reviews và shopping_lists.
  # Các associations này cho phép mỗi tài khoản có thể có nhiều công thức nấu ăn, đánh giá và danh sách mua sắm.
  has_many :recipes
  has_many :reviews
  has_many :shopping_lists
  
  # Phương thức để lấy danh sách tên của các associations trong model
  # Sử dụng `reflect_on_all_associations` để trả về danh sách tên của tất cả các associations đã định nghĩa trong model.
  def self.association_names
    self.reflect_on_all_associations.map(&:name)
  end

  # Tài khoản chỉ có một hình ảnh đính kèm
  has_one_attached :image

  # Xác thực rằng trường 'username', 'email' và 'password' không được để trống
  validates_presence_of :username, :email, :password
  # Xác thực rằng 'username', 'email' và 'password' là duy nhất (không trùng lặp)
  validates_uniqueness_of :username, :email, :password
  # Xác thực rằng độ dài của 'username', 'email', và 'password' không vượt quá 50 ký tự
  validates_length_of :username, :email, :password, maximum: 50
  # Xác thực rằng 'email' phải có định dạng hợp lệ (theo chuẩn email)
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  # Sau khi khởi tạo một bản ghi mới (new record), nếu không có giá trị cho 'role', gán giá trị mặc định là 'user'
  after_initialize :set_default_role, if: :new_record?

  private

  # Phương thức này sẽ tự động gán giá trị mặc định cho 'role' nếu nó chưa được xác định khi tạo bản ghi mới.
  # Nếu không có giá trị cho 'role', mặc định nó sẽ là 'user'.
  def set_default_role
    self.role ||= 'user'
  end
end
