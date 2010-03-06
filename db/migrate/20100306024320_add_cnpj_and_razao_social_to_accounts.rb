class AddCnpjAndRazaoSocialToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :cnpj, :integer
    add_column :accounts, :legal_name, :string
  end

  def self.down
    remove_column :accounts, :cnpj
    remove_column :accounts, :legal_name, :string
  end
end
