class Book < ApplicationRecord
  belongs_to :author
  has_many :groups
  has_many :categories, through: :groups
end
