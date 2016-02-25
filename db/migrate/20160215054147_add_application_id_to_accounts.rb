class AddApplicationIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :application_id, :integer
  end
end
