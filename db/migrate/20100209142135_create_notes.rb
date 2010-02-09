class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.references :creator
      t.references :commentable
      t.string :subject
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
