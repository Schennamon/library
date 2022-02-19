require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categories = Category.all
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get admin_panel" do
    get admin_panel_url
    assert_redirected_to login_url
  end

  test "should get admins_panel" do
    get admins_panel_url
    assert_redirected_to login_url
  end

  test "should get categories_panel" do
    get categories_panel_url
    assert_redirected_to login_url
  end

  test "should get books_panel" do
    get books_panel_url
    assert_redirected_to login_url
  end

end
