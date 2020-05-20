class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: '', unique: true
      t.string :phone, null: false, default: '', unique: true
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
