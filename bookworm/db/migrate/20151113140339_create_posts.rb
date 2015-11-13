class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user1, class_name: 'User'
      t.references :user2, class_name: 'User'
      t.references :book_page, class_name: 'BookPage'
      t.timestamps null: false
    end
  end
end
