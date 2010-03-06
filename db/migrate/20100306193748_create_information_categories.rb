class CreateInformationCategories < ActiveRecord::Migration
  def self.up
    create_table :information_categories do |t|
      t.string :name
      t.string :category_type
      t.string :data_type

      t.timestamps
    end
  end

  def self.down
    drop_table :information_categories
  end
end
