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

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2022_08_31_141003) do
=======
ActiveRecord::Schema[7.0].define(version: 2022_08_31_060711) do
>>>>>>> main
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "status"
    t.float "potential_rev"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount_spent"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_contacts_on_account_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.bigint "trigger_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trigger_id"], name: "index_keywords_on_trigger_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.text "keywords", default: [], array: true
    t.string "creator"
    t.string "video_url"
    t.string "description"
    t.string "content"
    t.date "pubDate"
    t.string "image_url"
    t.string "source_id"
    t.string "full_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "old_news", force: :cascade do |t|
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "triggers", force: :cascade do |t|
    t.date "date_added"
    t.string "name"
    t.bigint "account_id", null: false
    t.bigint "contact_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_triggers_on_account_id"
    t.index ["contact_id"], name: "index_triggers_on_contact_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "contacts", "accounts"
  add_foreign_key "keywords", "triggers"
  add_foreign_key "triggers", "accounts"
  add_foreign_key "triggers", "contacts"
end
