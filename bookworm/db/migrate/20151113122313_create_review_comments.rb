class CreateReviewComments < ActiveRecord::Migration
  def change
    create_table :review_comments do |t|
      t.integer :user_id
      t.integer :review_id
      t.string :comment

      t.timestamps null: false
    end
  end
end
