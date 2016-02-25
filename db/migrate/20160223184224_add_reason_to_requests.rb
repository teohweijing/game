class AddReasonToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :reason, :string
  end
end
