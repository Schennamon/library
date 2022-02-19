require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = Book.create(title: "Test")
    @category = Category.create(name: "Test")
    @group = Group.create(category_id: @category.id, book_id: @book.id)
  end

  test "should get new" do
    get new_group_url
    assert_redirected_to login_url
  end

  test "should create group" do
    post groups_url, params: { group: {  } }

    assert_redirected_to login_url
  end

  test "should destroy group" do
    delete group_url(@group)

    assert_redirected_to login_url
  end
end
