require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "Test")
  end

  test "should get new" do
    get new_category_url
    assert_redirected_to login_url
  end

  test "should create category" do
    post categories_url, params: { category: {  } }

    assert_redirected_to login_url
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_redirected_to login_url
  end

  test "should update category" do
    patch category_url(@category), params: { category: {  } }
    assert_redirected_to login_url
  end

  test "should destroy category" do
    delete category_url(@category)

    assert_redirected_to login_url
  end
end
