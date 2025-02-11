class Book < ApplicationRecord
    has_many :borrowings
    validates :title, :author, :isbn, presence: true
    validates :isbn, uniqueness: true
  
    # Check if the book is borrowed
    def borrowed?
      borrowings.exists? # Returns true if there are any borrowings for this book
    end
  end
  