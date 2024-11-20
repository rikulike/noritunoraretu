class RenameIntoroductionColumnToSeniorUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :senior_users, :intoroduction, :introduction
  end
end
