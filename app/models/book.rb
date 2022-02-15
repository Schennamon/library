class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_many :groups
  has_many :categories, through: :groups

  has_one_attached :cover

  validates :title, presence: true, length: { minimum: 3, maximum: 40 } 
end
