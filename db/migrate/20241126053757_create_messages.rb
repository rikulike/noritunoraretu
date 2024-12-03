class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :room_id
      t.integer :user_id
      t.text :message
      t.boolean :is_young, null: false, default: true,    comment: 'young_user=true senior_user=false'

      t.timestamps
    end
  end
end
