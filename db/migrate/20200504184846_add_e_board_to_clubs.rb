class AddEBoardToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :president, :string
    add_column :clubs, :vice_president, :string
  end
end
