class AddColumnSeniorUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :noritu_posts, :senior_user_id, :integer
  end
end
