class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.references :callable, :polymorphic => true
      t.string :number
      t.string :description
      t.string :company
      t.string :phone_type
      t.timestamps
    end
  end

  def self.down
    drop_table :phones
  end
end
