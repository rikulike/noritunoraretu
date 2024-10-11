class CreateWisdomPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :wisdom_posts do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
