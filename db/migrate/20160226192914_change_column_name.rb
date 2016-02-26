class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :accounts, :application_id, :app_id
  end
end
