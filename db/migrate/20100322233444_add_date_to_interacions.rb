class AddDateToInteracions < ActiveRecord::Migration
  def self.up
    add_column :interactions, :scheduled_date, :date
    add_column :interactions, :scheduled_time, :time
  end

  def self.down
    remove_column :interactions, :scheduled_date
    remove_column :interactions, :scheduled_time
  end
end
