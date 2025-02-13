# test/models/book_test.rb
require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should not save book without title, author, or isbn" do
    book = Book.new
    assert_not book.save, "Saved the book without a title, author, or ISBN"
  end

  test "should save valid book" do
    book = Book.new(title: "Test Book", author: "Test Author", isbn: "123456789")
    assert book.save, "Failed to save valid book"
  end

  test "should check if book is borrowed" do
    book = books(:one)
    assert_not book.borrowed?, "Book should not be borrowed"
    book.borrowings.create(user: users(:one), due_date: 2.weeks.from_now)
    assert book.borrowed?, "Book should be borrowed"
  end
end
