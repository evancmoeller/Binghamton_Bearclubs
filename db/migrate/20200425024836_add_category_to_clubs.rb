class AddCategoryToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :category, :string
  end
end
