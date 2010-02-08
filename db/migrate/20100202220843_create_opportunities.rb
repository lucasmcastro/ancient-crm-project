class CreateOpportunities < ActiveRecord::Migration
  def self.up
    create_table :opportunities, :force => true do |t|
      t.references :account
      t.references :manager
      t.references :creator
      t.references :product
      t.references :opportunity_status
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :opportunities
  end
end
