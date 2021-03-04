class Alterusercolum < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :verified, :boolean, :default => false
    change_column :users, :isAdmin, :boolean, :default => false
  end
end
