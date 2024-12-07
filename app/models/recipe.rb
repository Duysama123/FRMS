class Recipe < ApplicationRecord
  belongs_to :account
  has_one_attached :photo
end
