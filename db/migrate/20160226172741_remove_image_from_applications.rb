class RemoveImageFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :image, :attachment
  end
end
