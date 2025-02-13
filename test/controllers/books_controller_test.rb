# test/controllers/books_controller_test.rb
require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should show book" do
    book = books(:one)
    get book_url(book)
    assert_response :success
  end

  test "should borrow book" do
    book = books(:one)
    post borrow_book_url(book)
    assert_redirected_to profile_url
    assert_not_nil Borrowing.find_by(book: book, user: users(:one)), "Borrowing record should be created"
  end

  test "should return book" do
    book = books(:one)
    post return_book_url(book)
    assert_redirected_to profile_url
    assert_nil Borrowing.find_by(book: book, user: users(:one)), "Borrowing record should be deleted"
  end
end
