class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.integer :type
      t.text :body
      t.string :confirmation_message, null: false, default: ''

      t.timestamps
    end
  end
end
