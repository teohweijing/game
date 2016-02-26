class ChangeAppIdTypeInAccounts < ActiveRecord::Migration
  def change
  	change_column :accounts, :app_id, :integer
  end
end
