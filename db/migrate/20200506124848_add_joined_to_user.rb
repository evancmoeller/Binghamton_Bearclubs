class AddJoinedToUser < ActiveRecord::Migration
  def change
    add_column :users, :joined, :string
  end
end
