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

ActiveRecord::Schema.define(version: 2021_09_02_204817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "book_lookup", limit: 5, null: false
    t.string "name", limit: 16, null: false
    t.integer "chapters", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "verse_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_tags_on_topic_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
    t.index ["verse_id"], name: "index_tags_on_verse_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "topic", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "display"
    t.integer "access_level", default: 0, null: false
    t.integer "default_version", default: 0, null: false
  end

  create_table "verses", force: :cascade do |t|
    t.string "verse_lookup", limit: 13, null: false
    t.bigint "book_id", null: false
    t.integer "chapter", null: false
    t.integer "verse", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_verses_on_book_id"
  end

  add_foreign_key "tags", "topics"
  add_foreign_key "tags", "users"
  add_foreign_key "tags", "verses"
  add_foreign_key "verses", "books"
end
