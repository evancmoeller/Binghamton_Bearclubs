class AddUrlToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :url, :string
  end
end
