class AddLinkOneToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :link_one, :string
  end
end
