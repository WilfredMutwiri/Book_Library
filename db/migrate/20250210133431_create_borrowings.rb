class CreateBorrowings < ActiveRecord::Migration[7.0]
def change
  create_table :borrowings do |t|
    t.references :book, null: false, foreign_key: true
    t.references :user, null: false, foreign_key: true
    t.datetime :borrowed_at, null: false
    t.datetime :due_date

    t.timestamps
  end
end
end
