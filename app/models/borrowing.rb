class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book
  # validates :borrowed_at, presence: true
  validates :due_date, presence: true
  validates :borrowed_at, presence: true
  before_create :set_due_date

  private
  def set_due_date
    self.due_date = Time.current + 2.weeks
  end
end
