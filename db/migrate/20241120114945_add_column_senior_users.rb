class AddColumnSeniorUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :senior_users, :intoroduction, :text
  end
end
