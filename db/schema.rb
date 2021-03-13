# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_13_014242) do

  create_table "channels", force: :cascade do |t|
    t.string "youtube_channel_id"
    t.string "name"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["youtube_channel_id"], name: "index_channels_on_youtube_channel_id", unique: true
  end

  create_table "histories", force: :cascade do |t|
    t.integer "user_id_id", null: false
    t.integer "video_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id_id"], name: "index_histories_on_user_id_id"
    t.index ["video_id_id"], name: "index_histories_on_video_id_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "channel_id", null: false
    t.boolean "favorited"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_subscriptions_on_channel_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "uploadeds", force: :cascade do |t|
    t.integer "channel_id_id", null: false
    t.integer "video_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id_id"], name: "index_uploadeds_on_channel_id_id"
    t.index ["video_id_id"], name: "index_uploadeds_on_video_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "google_access_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "youtube_video_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "histories", "user_ids"
  add_foreign_key "histories", "video_ids"
  add_foreign_key "subscriptions", "channels"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "uploadeds", "channel_ids"
  add_foreign_key "uploadeds", "video_ids"
end
