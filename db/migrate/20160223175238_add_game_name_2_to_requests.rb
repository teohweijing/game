class AddGameName2ToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :game_name_2, :string
  end
end
