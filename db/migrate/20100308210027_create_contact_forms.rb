class CreateContactForms < ActiveRecord::Migration
  def self.up
    create_table :contact_forms do |t|
      t.references :contactable, :polymorphic => true
      t.references :contact_type
      t.string :contact

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_forms
  end
end
