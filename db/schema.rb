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

ActiveRecord::Schema[7.1].define(version: 2026_03_24_060230) do
  create_table "bank_accounts", force: :cascade do |t|
    t.string "title"
    t.boolean "hidden", default: true, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_blocks", force: :cascade do |t|
    t.integer "card_id"
    t.integer "position", default: 0, null: false
    t.string "blockable_type", null: false
    t.string "blockable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_blocks_on_card_id"
  end

  create_table "card_contents", force: :cascade do |t|
    t.text "content", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_pictures", force: :cascade do |t|
    t.string "picture", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.datetime "event_time"
    t.integer "card_blocks_count", default: 0, null: false
    t.integer "notices_count", default: 0, null: false
    t.integer "galleries_count", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "title"
    t.integer "gallery_pictures_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gallery_pictures", force: :cascade do |t|
    t.integer "gallery_id", null: false
    t.string "picture", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gallery_id"], name: "index_gallery_pictures_on_gallery_id"
  end

  create_table "map_contents", force: :cascade do |t|
    t.integer "map_id", null: false
    t.text "content", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_map_contents_on_map_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "title"
    t.integer "height"
    t.integer "level"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.boolean "hidden", default: true, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notice_links", force: :cascade do |t|
    t.integer "notices_id", null: false
    t.string "picture", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notices_id"], name: "index_notice_links_on_notices_id"
  end

  create_table "notice_pictures", force: :cascade do |t|
    t.integer "notices_id", null: false
    t.string "picture", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notices_id"], name: "index_notice_pictures_on_notices_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string "title"
    t.integer "title_level"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "title"
    t.string "phone"
    t.string "address"
    t.boolean "hidden", default: true, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_pictures", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "picture", null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_pictures_on_user_id"
  end

  create_table "user_point_logs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "point", default: 0, null: false
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_point_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 200, null: false
    t.string "name"
    t.string "encrypted_password", limit: 60, null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "user_pictures_count", default: 0, null: false
    t.integer "cards_count", default: 0, null: false
    t.integer "point", default: 3000, null: false
    t.string "phone"
    t.string "address"
    t.date "birthday"
    t.boolean "enable", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
