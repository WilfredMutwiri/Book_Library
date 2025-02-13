class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @borrowed_books = current_user.borrowings.includes(:book)
  end
  def borrowed_books
    @borrowed_books = current_user.borrowed_books
  end
end
