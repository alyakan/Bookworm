class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :accept , default: 0

      t.timestamps null: false
    end
  end
end
