class ChangeNoteCommentableVersionToVersionableVersion < ActiveRecord::Migration
  def self.up
    rename_column :notes, :commentable_version, :versionable_version
  end

  def self.down
    rename_column :notes, :versionable_version, :commentable_version
  end
end
