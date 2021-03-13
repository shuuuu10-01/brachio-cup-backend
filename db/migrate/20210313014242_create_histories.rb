class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :video_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
