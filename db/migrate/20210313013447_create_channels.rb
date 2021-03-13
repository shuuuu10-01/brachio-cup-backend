class CreateChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :channels do |t|
      t.string :youtube_channel_id
      t.string :name
      t.string :avatar

      t.timestamps
    end
    add_index :channels, :youtube_channel_id, unique: true
  end
end
