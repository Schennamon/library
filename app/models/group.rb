class Group < ApplicationRecord
  belongs_to :book
  belongs_to :category
end
