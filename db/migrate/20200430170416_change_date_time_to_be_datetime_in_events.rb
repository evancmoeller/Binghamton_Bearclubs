class ChangeDateTimeToBeDatetimeInEvents < ActiveRecord::Migration
  def change
    change_column :events, :date_time, :datetime
  end
end
