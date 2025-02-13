class Book < ApplicationRecord
    has_many :borrowings
    validates :title, :author, :isbn, presence: true
    validates :isbn, uniqueness: true
      def borrowed?
      borrowings.exists? 
    end
  end
  