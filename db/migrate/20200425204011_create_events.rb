class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :date_time
      t.string :location

      t.timestamps null: false
    end
  end
end
