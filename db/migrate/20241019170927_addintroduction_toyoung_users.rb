class AddintroductionToyoungUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :young_users, :introduction, :text
  end
end
