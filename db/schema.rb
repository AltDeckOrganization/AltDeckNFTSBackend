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

ActiveRecord::Schema[7.0].define(version: 2022_04_08_002721) do
  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.text "profile_image_path"
    t.text "collection_image_path"
    t.text "form_data"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drops", force: :cascade do |t|
    t.string "name"
    t.text "form_data"
    t.text "profile_image_path"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "launches", force: :cascade do |t|
    t.string "name"
    t.text "profile_image_path"
    t.text "collection_image_path"
    t.text "form_data"
    t.string "candymachine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "page_data"
    t.integer "status"
  end

  create_table "launchpad_statistics", force: :cascade do |t|
    t.integer "launch_id", null: false
    t.text "whitelist_mint_settings"
    t.integer "mint_price"
    t.decimal "mint_currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "altdeck_revenue"
    t.string "total_revenue_generated"
    t.index ["launch_id"], name: "index_launchpad_statistics_on_launch_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "launchpad_statistics", "launches"
end
