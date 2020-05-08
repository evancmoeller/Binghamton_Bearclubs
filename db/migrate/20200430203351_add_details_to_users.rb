class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :b_number, :string
    add_column :users, :acct_type, :string
    add_column :users, :major, :string
    add_column :users, :grad_year, :string
  end
end
