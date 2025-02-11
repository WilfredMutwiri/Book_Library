# class BooksController < ApplicationController
#   before_action :authenticate_user!
#   #, only: [:borrow, :return]

#   # Display list of books
#   def index
#     @books = Book.all
#   end

#   # Show details for a specific book
#   def show
#     @book = Book.find_by(id: params[:id])
#     unless @book
#       redirect_to books_path, alert: 'Book not found.'
#     end
#   end

#   # Borrow a book
#   def borrow
#     @book = Book.find(params[:id])

#     # Check if the book exists
#     unless @book
#       redirect_to books_path, alert: 'Book not found.'
#       return
#     end

#     # Check if the book is already borrowed
#     if @book.borrowed?
#       redirect_to books_path, alert: 'This book is already borrowed.'
#     else
#       # Create a borrowing record
#       @book.borrowings.create(user: current_user, due_date: 2.weeks.from_now)
#       redirect_to profile_path, notice: 'You have successfully borrowed the book.'
#     end
#   end

#   # Return a borrowed book
#   def return
#     @book = Book.find(params[:id])
#     borrowing = @book.borrowings.find_by(user: current_user)

#     if borrowing
#       borrowing.destroy
#       redirect_to profile_path, notice: 'You have successfully returned the book.'
#     else
#       redirect_to profile_path, alert: 'You have not borrowed this book.'
#     end
#   end
# end


class BooksController < ApplicationController
  before_action :authenticate_user! # Require authentication for all actions

  # Display list of books
  def index
    @books = Book.all
  end

  # Show details for a specific book
  def show
    @book = Book.find_by(id: params[:id])
    unless @book
      redirect_to books_path, alert: 'Book not found.'
    end
  end

  # Borrow a book
  def borrow
    @book = Book.find_by(id: params[:id])
    unless @book
      redirect_to books_path, alert: 'Book not found.' and return
    end

    if @book.borrowed?
      redirect_to books_path, alert: 'This book is already borrowed.'
    else
      @book.borrowings.create(user: current_user, due_date: 2.weeks.from_now)
      redirect_to profile_path, notice: 'You have successfully borrowed the book.'
    end
  end

  # Return a borrowed book
  def return
    @book = Book.find_by(id: params[:id])
    unless @book
      redirect_to books_path, alert: 'Book not found.' and return
    end

    borrowing = @book.borrowings.find_by(user: current_user)
    
    if borrowing
      borrowing.destroy
      redirect_to profile_path, notice: 'You have successfully returned the book.'
    else
      redirect_to profile_path, alert: 'You have not borrowed this book.'
    end
  end
end
