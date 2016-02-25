class AddApprovedByToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :approved_by, :string
  end
end
