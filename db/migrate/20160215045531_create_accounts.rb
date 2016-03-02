class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :password
      t.belongs_to :user, index: true, foreign_key: true

      #just added in PG
      t.belongs_to :application, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
