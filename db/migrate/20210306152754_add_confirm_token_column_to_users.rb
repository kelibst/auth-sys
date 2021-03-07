class AddConfirmTokenColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :confirm_token, :string
  end
end
