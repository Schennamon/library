require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = Book.create(title: "Test")
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_redirected_to login_url
  end

  test "should create book" do
    post books_url, params: { book: {  } }

    assert_redirected_to login_url
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_redirected_to login_url
  end

  test "should update book" do
    patch book_url(@book), params: { book: {  } }
    assert_redirected_to login_url
  end

  test "should destroy book" do
    delete book_url(@book)

    assert_redirected_to login_url
  end
end
