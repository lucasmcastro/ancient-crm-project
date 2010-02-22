class AddCommentableVersionToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :commentable_version, :integer
  end

  def self.down
    remove_column :notes, :commentable_version 
  end
end
