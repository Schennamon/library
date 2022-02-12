require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    @book = Book.new(title: "Sports", author_id: 1)
  end

  test "book should be valid" do
    Author.create(id: 1, name: "T.G. Shevchenko")
    assert @book.valid?
  end

  test "title should be present" do
    @book.title = ""
    assert_not @book.valid?
  end

  test "title should not be too long" do
    @book.title = "a" * 41
    assert_not @book.valid?
  end

  test "title should not be too short" do
    @book.title = "a"
    assert_not @book.valid?
  end
end
