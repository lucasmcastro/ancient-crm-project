class AddResponsibleToIssue < ActiveRecord::Migration
  def self.up
    add_column :issues, :responsible_id, :integer
  end

  def self.down
    remove_column :issues, :responsible_id
  end
end
