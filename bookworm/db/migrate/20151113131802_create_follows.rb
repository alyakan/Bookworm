class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.integer :accept , default: 0

      t.timestamps null: false
    end
  end
end
