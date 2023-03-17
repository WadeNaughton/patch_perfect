# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_16_172653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "complete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["complete_id"], name: "index_comments_on_complete_id"
  end

  create_table "complete_gears", force: :cascade do |t|
    t.bigint "complete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_gear_id"
    t.index ["complete_id"], name: "index_complete_gears_on_complete_id"
    t.index ["user_gear_id"], name: "index_complete_gears_on_user_gear_id"
  end

  create_table "completes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hike_id"
    t.string "title"
    t.index ["hike_id"], name: "index_completes_on_hike_id"
    t.index ["user_id"], name: "index_completes_on_user_id"
  end

  create_table "costs", force: :cascade do |t|
    t.bigint "complete_id"
    t.float "price"
    t.string "item"
    t.bigint "user_id"
    t.index ["complete_id"], name: "index_costs_on_complete_id"
    t.index ["user_id"], name: "index_costs_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hike_id"
    t.index ["hike_id"], name: "index_favorites_on_hike_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "guest_costs", force: :cascade do |t|
    t.bigint "participant_id"
    t.float "price"
    t.string "item"
    t.index ["participant_id"], name: "index_guest_costs_on_participant_id"
  end

  create_table "hike_comments", force: :cascade do |t|
    t.bigint "hike_id"
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "user_id"
    t.index ["hike_id"], name: "index_hike_comments_on_hike_id"
    t.index ["user_id"], name: "index_hike_comments_on_user_id"
  end

  create_table "hikes", force: :cascade do |t|
    t.string "name"
    t.integer "elevation"
    t.string "prominence"
    t.string "state"
    t.string "location"
    t.string "range"
    t.string "features"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "participant_comments", force: :cascade do |t|
    t.bigint "participant_id"
    t.text "body"
    t.index ["participant_id"], name: "index_participant_comments_on_participant_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "complete_id"
    t.bigint "user_id"
    t.index ["complete_id"], name: "index_participants_on_complete_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "complete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["complete_id"], name: "index_photos_on_complete_id"
  end

  create_table "user_gears", force: :cascade do |t|
    t.bigint "user_id"
    t.float "pounds"
    t.string "name"
    t.integer "ounces"
    t.index ["user_id"], name: "index_user_gears_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "completes"
  add_foreign_key "complete_gears", "completes"
  add_foreign_key "complete_gears", "user_gears"
  add_foreign_key "completes", "hikes"
  add_foreign_key "completes", "users"
  add_foreign_key "costs", "completes"
  add_foreign_key "costs", "users"
  add_foreign_key "favorites", "hikes"
  add_foreign_key "favorites", "users"
  add_foreign_key "guest_costs", "participants"
  add_foreign_key "hike_comments", "hikes"
  add_foreign_key "hike_comments", "users"
  add_foreign_key "participant_comments", "participants"
  add_foreign_key "participants", "completes"
  add_foreign_key "participants", "users"
  add_foreign_key "photos", "completes"
  add_foreign_key "user_gears", "users"
end
