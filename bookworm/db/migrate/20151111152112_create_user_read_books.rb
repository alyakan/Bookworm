class CreateUserReadBooks < ActiveRecord::Migration
  def change
    create_table :user_read_books do |t|
      t.integer :status

      t.timestamps null: false
    end
  end
end
