class ChangeApplicationIdTypeInAccounts < ActiveRecord::Migration
  def change
  	change_column :accounts, :application_id, :string
  end
end
