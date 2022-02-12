require "test_helper"

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = Group.new(book_id: 1, category_id: 1)
  end

  test "group should be valid" do
    Author.create(id: 1, name: "T.G. Shevchenko")
    Book.create(id: 1, title: "Kobzar", author_id: 1)
    Category.create(id: 1, name: "Poems")
    assert @group.valid?
  end
end
