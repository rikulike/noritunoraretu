class AddyoungUserIdTowisdomPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :wisdom_posts, :young_user_id, :integer
  end
end
