class Author < ApplicationRecord
  has_and_belongs_to_many :books

  validates :name, presence: true, length: { minimum: 3, maximum: 40 } 
end
