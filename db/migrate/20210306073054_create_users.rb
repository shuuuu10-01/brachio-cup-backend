class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :uid, null: false
      t.string :icon
      t.string :google_access_token, null: false

      t.timestamps
    end
  end
end
