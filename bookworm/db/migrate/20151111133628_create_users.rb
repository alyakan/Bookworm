class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :gender
      t.string :city
      t.string :country
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
