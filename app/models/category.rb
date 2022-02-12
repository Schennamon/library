class Category < ApplicationRecord
  has_many :groups
  has_many :books, through: :groups
end
