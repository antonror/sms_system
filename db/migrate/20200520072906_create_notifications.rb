class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.integer :kind
      t.text :body
      t.boolean :something_wrong, default: false
      t.string :confirmation_message, null: false, default: ''

      t.timestamps
    end
  end
end
