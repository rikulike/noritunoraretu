class ChangeCloumnsNotnullAddYoungUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :young_users, :name, :string, null:false
  end
end
