class ChangeDateTimeToBeStringInEvents < ActiveRecord::Migration
  def change
    change_column :events, :date_time, :string
  end
end
