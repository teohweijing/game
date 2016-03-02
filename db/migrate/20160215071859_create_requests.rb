class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :category
      t.string :game_name
      t.string :bank_name
      t.string :bank_acc
      t.integer :amount
      #just added to PG
      t.string :status

      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
