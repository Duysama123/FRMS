class Step < ApplicationRecord
  belongs_to :recipe

  has_one_attached :image
  has_one_attached :video

  validates :position, presence: true
  validates :instruction, presence: true
  validates_numericality_of :position, only_integer: true, greater_than: 0 
end
