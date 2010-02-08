class CreateInteractions < ActiveRecord::Migration
  def self.up
    create_table :interactions do |t|
      t.references :creator
      t.references :opportunity
      t.references :type
      t.string :subject
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :interactions
  end
end
