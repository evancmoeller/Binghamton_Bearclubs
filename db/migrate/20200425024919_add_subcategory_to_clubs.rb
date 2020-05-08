class AddSubcategoryToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :subcategory, :string
  end
end
