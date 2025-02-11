class ProfilesController < ApplicationController
  before_action :authenticate_user!

  # Display user profile
  def show
    @user = current_user
  end

  # List borrowed books
  def borrowed_books
    @borrowed_books = current_user.borrowed_books
  end
end
