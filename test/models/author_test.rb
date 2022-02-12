require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  def setup
    @author = Author.new(name: "T.G. Shevchenko")
  end

  test "author should be valid" do
    assert @author.valid?
  end

  test "name should be present" do
    @author.name = ""
    assert_not @author.valid?
  end

  test "name should not be too long" do
    @author.name = "a" * 41
    assert_not @author.valid?
  end

  test "name should not be too short" do
    @author.name = "a"
    assert_not @author.valid?
  end
end
