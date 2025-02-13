class BooksController < ApplicationController
  before_action :authenticate_user! 
  def index
    @books = Book.all
  end
  def profile
    @borrowed_books = current_user.borrowings.includes(:book)
  end
  def show
    @book = Book.find_by(id: params[:id])
    unless @book
      redirect_to books_path, alert: 'Book not found.'
    end
  end
  def borrow
    @book = Book.find_by(id: params[:id])
    unless @book
      redirect_to books_path, alert: 'Book not found.' and return
    end

    if @book.borrowed?
      redirect_to books_path, alert: 'This book is already borrowed.'
    else
      @book.borrowings.create(user: current_user, due_date: 2.weeks.from_now, borrowed_at: Time.current)
      redirect_to profile_path, notice: 'You have successfully borrowed the book.'
    end
  end
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
