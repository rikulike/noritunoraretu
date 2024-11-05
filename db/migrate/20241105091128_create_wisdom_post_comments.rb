class CreateWisdomPostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :wisdom_post_comments do |t|
      t.text :comment
      t.integer :young_user_id
      t.integer :wisdom_post_id

      t.timestamps
    end
  end
end
