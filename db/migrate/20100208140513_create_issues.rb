class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.references :creator
      t.references :opportunity
      t.references :status
      t.string :subject
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
