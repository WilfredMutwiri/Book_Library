class User < ApplicationRecord
  # Devise modules (add other modules as needed)
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Relationship with borrowed books
  has_many :borrowings
  has_many :borrowed_books, through: :borrowings, source: :book
end
