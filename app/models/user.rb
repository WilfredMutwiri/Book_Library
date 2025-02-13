class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :borrowings
  has_many :borrowed_books, through: :borrowings, source: :book
end
