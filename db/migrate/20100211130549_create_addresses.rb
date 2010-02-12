class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :addressable, :polymorphic => true
      t.string :zip
      t.string :street_1
      t.string :street_2
      t.string :city_area
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
