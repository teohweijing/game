class ChangeAppIdName < ActiveRecord::Migration
  def change
  	rename_column :accounts, :app_id, :application_id
  end
end
