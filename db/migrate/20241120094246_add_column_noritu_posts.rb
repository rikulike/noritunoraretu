class AddColumnNorituPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :noritu_posts, :title, :string
    add_column :noritu_posts, :body, :text
  end
end
