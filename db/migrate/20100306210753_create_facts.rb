class CreateFacts < ActiveRecord::Migration
  def self.up
    create_table :facts do |t|
      t.references :informable, :polymorphic => true
      t.references :information_category
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :facts
  end
end
