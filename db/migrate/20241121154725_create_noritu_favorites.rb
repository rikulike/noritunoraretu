class CreateNorituFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :noritu_favorites do |t|
      t.integer :young_user_id
      t.integer :noritu_post_id

      t.timestamps
    end
  end
end
