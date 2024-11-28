class AddColumnRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :noritu_post, :integer
  end
end
