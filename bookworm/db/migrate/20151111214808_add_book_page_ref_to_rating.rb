class AddBookPageRefToRating < ActiveRecord::Migration
  def change
    add_reference :ratings, :book_page, index: true, foreign_key: true
  end
end
