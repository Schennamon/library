require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { described_class.new(name: 'John') }
  let(:author_with_wrong_name) { described_class.new(name: nil) }

  it 'validates name' do 
    should validate_presence_of :name
    should validate_length_of(:name).is_at_least(3)
    should validate_length_of(:name).is_at_most(40)
  end

  it 'has_and_belong_to_many' do 
    should have_and_belong_to_many :books
  end

  it 'returns name' do
    expect(author.name).to eq('John')
  end
end
