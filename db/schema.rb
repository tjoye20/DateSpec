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

ActiveRecord::Schema.define(version: 20160928081856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admirers", force: :cascade do |t|
    t.integer  "user_id",                      null: false
    t.integer  "admirer_id",                   null: false
    t.text     "q1_response",                  null: false
    t.text     "q2_response",                  null: false
    t.text     "q3_response",                  null: false
    t.boolean  "user_approved", default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "q1"
    t.text     "q2"
    t.text     "q3"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "identities", force: :cascade do |t|
    t.string  "uid"
    t.string  "provider"
    t.integer "user_id"
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                       null: false
    t.string   "email",                          null: false
    t.boolean  "active",          default: true, null: false
    t.string   "password_digest"
    t.string   "gender",                         null: false
    t.string   "gender_seeking",                 null: false
    t.text     "bio",                            null: false
    t.text     "question_1",                     null: false
    t.text     "question_2",                     null: false
    t.text     "question_3",                     null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
