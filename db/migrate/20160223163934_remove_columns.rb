class RemoveColumns < ActiveRecord::Migration
  def self.up
  	remove_column :requests, :promotion_id
  end 
end
