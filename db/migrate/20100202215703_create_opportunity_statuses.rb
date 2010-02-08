class CreateOpportunityStatuses < ActiveRecord::Migration
  def self.up
    create_table :opportunity_statuses, :force => true do |t|
      t.references :creator
      t.string :name
      t.integer :order

      t.timestamps
    end
end

  def self.down
    drop_table :opportunity_statuses
  end
end
