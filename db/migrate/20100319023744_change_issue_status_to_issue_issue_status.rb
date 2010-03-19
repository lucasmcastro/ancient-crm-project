class ChangeIssueStatusToIssueIssueStatus < ActiveRecord::Migration
  def self.up
    rename_column :issues, :status_id, :issue_status_id
  end

  def self.down
    rename_column :issues, :issue_status_id, :status_id
  end
end
