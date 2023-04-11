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

ActiveRecord::Schema.define(version: 2023_04_11_130355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "isbn"
    t.string "author"
    t.string "dewey_decimal"
    t.string "issn"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "borrows", force: :cascade do |t|
    t.bigint "reading_material_id", null: false
    t.date "date"
    t.date "due_date"
    t.boolean "is_borrowed", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reading_material_id"], name: "index_borrows_on_reading_material_id"
  end

  create_table "e_books", force: :cascade do |t|
    t.string "isbn"
    t.string "author"
    t.string "dewey_decimal"
    t.string "issn"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "magazines", force: :cascade do |t|
    t.float "volume"
    t.string "author"
    t.integer "issue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "newspapers", force: :cascade do |t|
    t.string "publisher"
    t.date "issue_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reading_materials", force: :cascade do |t|
    t.string "title"
    t.string "material_type", null: false
    t.bigint "material_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.index ["material_type", "material_id"], name: "index_reading_materials_on_material"
  end

  create_table "request_extensions", force: :cascade do |t|
    t.bigint "borrow_id", null: false
    t.string "status"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["borrow_id"], name: "index_request_extensions_on_borrow_id"
  end

  create_table "theses", force: :cascade do |t|
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "borrows", "reading_materials"
  add_foreign_key "request_extensions", "borrows"
end
