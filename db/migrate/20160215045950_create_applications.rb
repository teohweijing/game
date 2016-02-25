class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
