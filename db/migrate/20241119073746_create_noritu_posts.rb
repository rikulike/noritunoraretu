class CreateNorituPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :noritu_posts do |t|
      t.datetime :datetime
      t.string :current_location
      t.string :destination

      t.timestamps
    end
  end
end
