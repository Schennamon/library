class Admin < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 } 
  validates_uniqueness_of :name

  has_secure_password
end
