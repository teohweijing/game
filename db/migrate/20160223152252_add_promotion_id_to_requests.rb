class AddPromotionIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :promotion_id, :integer
  end
end
