class Account < ApplicationRecord
  has_many :recipes
has_many :reviews
has_many :shopping_lists
 # Phương thức để lấy tên các associations
 def self.association_names
  self.reflect_on_all_associations.map(&:name)
end
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username, :email, :password 
  validates_length_of :username, :email, :password, maximum: 50
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  after_initialize :set_default_role, if: :new_record?
  private

  def set_default_role
   self.role ||= 'user'
end

end
