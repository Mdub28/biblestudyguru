# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151004043821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annotation_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "annotations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "annotation_type_id"
    t.text     "content"
    t.boolean  "private"
    t.integer  "bible_book_id"
    t.integer  "chapter_start"
    t.integer  "verse_start"
    t.integer  "character_start"
    t.integer  "chapter_end"
    t.integer  "verse_end"
    t.integer  "character_end"
    t.integer  "bible_translation_id"
    t.boolean  "deleted"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "annotations", ["annotation_type_id"], name: "index_annotations_on_annotation_type_id", using: :btree
  add_index "annotations", ["bible_book_id"], name: "index_annotations_on_bible_book_id", using: :btree
  add_index "annotations", ["bible_translation_id"], name: "index_annotations_on_bible_translation_id", using: :btree
  add_index "annotations", ["user_id"], name: "index_annotations_on_user_id", using: :btree

  create_table "bible_books", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "book_id"
  end

  create_table "bible_passage_annotations", force: :cascade do |t|
    t.integer  "annotation_id"
    t.integer  "position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "bible_passage_annotations", ["annotation_id"], name: "index_bible_passage_annotations_on_annotation_id", using: :btree

  create_table "bible_translations", force: :cascade do |t|
    t.string   "description"
    t.string   "abbreviation"
    t.string   "language"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "denominations", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "studies", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "description"
  end

  add_index "studies", ["course_id"], name: "index_studies_on_course_id", using: :btree

  create_table "study_passages", force: :cascade do |t|
    t.integer  "study_id"
    t.integer  "bible_book_id"
    t.integer  "chapter_start"
    t.integer  "verse_start"
    t.integer  "chapter_end"
    t.integer  "verse_end"
    t.integer  "bible_translation_id"
    t.integer  "position"
    t.integer  "bible_passage_annotation_id"
    t.integer  "duration_in_minutes"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "study_passages", ["bible_book_id"], name: "index_study_passages_on_bible_book_id", using: :btree
  add_index "study_passages", ["bible_passage_annotation_id"], name: "index_study_passages_on_bible_passage_annotation_id", using: :btree
  add_index "study_passages", ["bible_translation_id"], name: "index_study_passages_on_bible_translation_id", using: :btree
  add_index "study_passages", ["study_id"], name: "index_study_passages_on_study_id", using: :btree

  create_table "user_actions", force: :cascade do |t|
    t.string   "description"
    t.string   "link_text"
    t.string   "link"
    t.integer  "user_id"
    t.integer  "weight"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_actions", ["user_id"], name: "index_user_actions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "annotation_id"
    t.boolean  "is_positive"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "votes", ["annotation_id"], name: "index_votes_on_annotation_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "annotations", "annotation_types"
  add_foreign_key "annotations", "bible_books"
  add_foreign_key "annotations", "bible_translations"
  add_foreign_key "annotations", "users"
  add_foreign_key "bible_passage_annotations", "annotations"
  add_foreign_key "courses", "users"
  add_foreign_key "studies", "courses"
  add_foreign_key "study_passages", "bible_books"
  add_foreign_key "study_passages", "bible_passage_annotations"
  add_foreign_key "study_passages", "bible_translations"
  add_foreign_key "study_passages", "studies"
  add_foreign_key "user_actions", "users"
  add_foreign_key "votes", "annotations"
  add_foreign_key "votes", "users"
end
