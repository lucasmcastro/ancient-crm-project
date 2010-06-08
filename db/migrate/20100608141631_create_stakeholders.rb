class CreateStakeholders < ActiveRecord::Migration
  def self.up
    create_table :stakeholders, :force => true do |t|
      t.references :person
      t.references :interaction

      t.timestamps
    end
  end

  def self.down
    drop_table :stakeholders
  end
end
