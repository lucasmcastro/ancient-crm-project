class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.references :creator
      t.references :person
      t.references :linkable, :polymorphic => true
      t.string :link_type
      t.string :complement

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
