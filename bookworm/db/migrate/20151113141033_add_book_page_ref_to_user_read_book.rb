class AddBookPageRefToUserReadBook < ActiveRecord::Migration
  def change
    add_reference :user_read_books, :book_page, index: true, foreign_key: true
  end
end
