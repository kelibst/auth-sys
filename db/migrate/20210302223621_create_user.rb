class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :firstname
      t.string :lastname
      t.boolean :isAdmin
      t.boolean :verified
      t.timestamps
    end
  end
end
