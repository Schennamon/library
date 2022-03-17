require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has_and_belongs_to_many' do 
    should have_and_belong_to_many :authors
  end

  it 'has_many' do 
    have_many :groups
    have_many :categories
  end

  it 'has_one_attached' do 
    should have_one_attached :cover
  end

  it 'validates title' do 
    should validate_presence_of :title 
    should validate_length_of(:title).is_at_least(3)
    should validate_length_of(:title).is_at_most(40)
  end
end
