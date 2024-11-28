class RemoveNorituPostIdFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :noritu_post_id, :integer
  end
end
