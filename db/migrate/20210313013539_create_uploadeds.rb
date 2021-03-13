class CreateUploadeds < ActiveRecord::Migration[6.1]
  def change
    create_table :uploadeds do |t|
      t.references :channel_id, null: false, foreign_key: true
      t.references :video_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
