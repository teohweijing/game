class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :description
      t.integer :application_id

      t.timestamps null: false
    end
  end
end
