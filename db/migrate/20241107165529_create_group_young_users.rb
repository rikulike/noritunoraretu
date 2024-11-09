class CreateGroupYoungUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_young_users do |t|
      t.integer :young_user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
