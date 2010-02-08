class CreateInteractionTypes < ActiveRecord::Migration
  def self.up
    create_table :interaction_types, :force => true do |t|
      t.references :creator
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :interaction_types
  end
end
