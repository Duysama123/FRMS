class User < ApplicationRecord
  
has_person_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Phương thức kiểm tra admin
  def admin?
    self.role == 'admin' # Hoặc bất kỳ logic nào bạn sử dụng
  end
end
