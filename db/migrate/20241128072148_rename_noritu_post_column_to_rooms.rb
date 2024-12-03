class RenameNorituPostColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :noritu_post, :noritu_post_id
  end
end
