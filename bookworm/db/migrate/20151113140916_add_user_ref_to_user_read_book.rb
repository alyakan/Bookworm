class AddUserRefToUserReadBook < ActiveRecord::Migration
  def change
    add_reference :user_read_books, :user, index: true, foreign_key: true
  end
end
