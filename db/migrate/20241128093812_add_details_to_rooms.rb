class AddDetailsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :noritu_favorite_id, :integer
  end
end
