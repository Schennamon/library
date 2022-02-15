class Book < ApplicationRecord
  belongs_to :author
  has_many :groups
  has_many :categories, through: :groups

  has_one_attached :cover

  validates :title, presence: true, length: { minimum: 3, maximum: 40 } 
end
