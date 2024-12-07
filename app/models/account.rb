class Account < ApplicationRecord
has_many :recipes
has_many :reviews
has_many :shopping_lists

 # Phương thức để lấy tên các associations
 def self.association_names
  self.reflect_on_all_associations.map(&:name)
end
end
