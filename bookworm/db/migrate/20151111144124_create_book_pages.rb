class CreateBookPages < ActiveRecord::Migration
  def change
    create_table :book_pages do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.integer :year
      t.string :genre
      t.integer :ISBN
      t.float :avg_rating

      t.timestamps null: false
    end
  end
end
