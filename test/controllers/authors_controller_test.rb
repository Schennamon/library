require "test_helper"

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = Author.create(name: "Taras")
  end

  test "should get index" do
    get authors_url
    assert_response :success
  end

  test "should get new" do
    get new_author_url
    assert_redirected_to login_url
  end

  test "should create author" do
    post authors_url, params: { author: {  } }

    assert_redirected_to login_url
  end

  test "should show author" do
    get author_url(@author)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_url(@author)
    assert_redirected_to login_url
  end

  test "should update author" do
    patch author_url(@author), params: { author: {  } }
    assert_redirected_to login_url
  end

  test "should destroy author" do
    delete author_url(@author)

    assert_redirected_to login_url
  end
end
