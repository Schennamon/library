class Category < ApplicationRecord
  has_many :groups
  has_many :books, through: :groups

  validates :name, presence: true, length: { minimum: 3, maximum: 25 } 
  validates_uniqueness_of :name
end
