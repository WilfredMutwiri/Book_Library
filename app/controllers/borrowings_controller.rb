class BorrowingsController < ApplicationController
    before_action :set_book, only: [:create, :return]
      def create
      @borrowing = @book.borrowings.new(user: current_user, borrowed_at: Time.current)
  
      if @borrowing.save
        redirect_to borrowed_books_path, notice: 'Book successfully borrowed!'
      else
        redirect_to @book, alert: 'Something went wrong. Please try again.'
      end
    end
      def return
      @borrowing = @book.borrowings.find_by(user: current_user)
  
      if @borrowing
        @borrowing.destroy
        redirect_to borrowed_books_path, notice: 'Book successfully returned!'
      else
        redirect_to borrowed_books_path, alert: 'This book was not borrowed by you.'
      end
    end
  
    private
      def set_book
      @book = Book.find(params[:book_id])
    end
  end
  