require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create(name: "Admin", password: "1234", root: true)
  end

  test "should get new" do
    get new_admin_url
    assert_redirected_to login_url
  end

  test "should create admin" do
    post admins_url, params: { admin: {  } }

    assert_redirected_to login_url
  end

  test "should get edit" do
    get admins_edit_url
    assert_redirected_to login_url
  end

  test "should update admin" do
    patch admin_url(@admin), params: { admin: {  } }
    assert_redirected_to login_url
  end

  test "should destroy admin" do
    delete admins_remove_url

    assert_redirected_to login_url
  end
end
