class AddHolderNameToBanks < ActiveRecord::Migration
  def change
    add_column :banks, :holder_name, :string
  end
end
