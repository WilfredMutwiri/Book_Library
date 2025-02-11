require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get profiles_show_url
    assert_response :success
  end

  test "should get borrowed_books" do
    get profiles_borrowed_books_url
    assert_response :success
  end
end
