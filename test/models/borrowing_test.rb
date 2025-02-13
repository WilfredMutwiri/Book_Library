# test/models/borrowing_test.rb
require 'test_helper'

class BorrowingTest < ActiveSupport::TestCase
  test "should not save borrowing without borrowed_at" do
    borrowing = Borrowing.new
    assert_not borrowing.save, "Saved the borrowing without borrowed_at"
  end

  test "should set due date automatically" do
    borrowing = Borrowing.new(user: users(:one), book: books(:one), borrowed_at: Time.current)
    borrowing.save
    assert_not_nil borrowing.due_date, "Due date should be set"
    assert_equal 2.weeks.from_now.to_date, borrowing.due_date.to_date, "Due date should be 2 weeks from borrowing date"
  end
end
