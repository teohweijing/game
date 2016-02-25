class RemoveImageFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :image, :string
  end
end
