class Book < ApplicationRecord
  belongs_to :author
  has_many :groups
  has_many :categories, through: :groups

  validates :title, presence: true, length: { minimum: 3, maximum: 40 } 
end
