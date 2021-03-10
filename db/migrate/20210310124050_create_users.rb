class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :google_access_token
      t.string :id_token

      t.timestamps
    end
  end
end
