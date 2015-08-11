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

ActiveRecord::Schema.define(version: 20150809153803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aliases", force: :cascade do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "aliases", ["name"], name: "index_aliases_on_name", unique: true, using: :btree
  add_index "aliases", ["subject_type", "subject_id"], name: "index_aliases_on_subject_type_and_subject_id", using: :btree

  create_table "collaborations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "collaborations", ["name"], name: "index_collaborations_on_name", unique: true, using: :btree

  create_table "episode_staffers", force: :cascade do |t|
    t.integer  "staffer_id"
    t.integer  "alias_id"
    t.integer  "episode_id"
    t.integer  "role",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "episode_staffers", ["alias_id"], name: "index_episode_staffers_on_alias_id", using: :btree
  add_index "episode_staffers", ["episode_id"], name: "index_episode_staffers_on_episode_id", using: :btree
  add_index "episode_staffers", ["role"], name: "index_episode_staffers_on_role", using: :btree
  add_index "episode_staffers", ["staffer_id"], name: "index_episode_staffers_on_staffer_id", using: :btree

  create_table "episodes", force: :cascade do |t|
    t.integer  "show_id"
    t.integer  "number"
    t.string   "url"
    t.integer  "translation", default: 0
    t.integer  "editing",     default: 0
    t.integer  "checking",    default: 0
    t.integer  "timing",      default: 0
    t.integer  "typesetting", default: 0
    t.integer  "encoding",    default: 0
    t.integer  "qchecking",   default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "episodes", ["number"], name: "index_episodes_on_number", using: :btree
  add_index "episodes", ["show_id"], name: "index_episodes_on_show_id", using: :btree

  create_table "fansub_collaborations", force: :cascade do |t|
    t.integer  "fansub_id"
    t.integer  "collaboration_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "fansub_collaborations", ["collaboration_id"], name: "index_fansub_collaborations_on_collaboration_id", using: :btree
  add_index "fansub_collaborations", ["fansub_id"], name: "index_fansub_collaborations_on_fansub_id", using: :btree

  create_table "fansub_staffers", force: :cascade do |t|
    t.integer  "staffer_id"
    t.integer  "fansub_id"
    t.integer  "role",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "fansub_staffers", ["fansub_id"], name: "index_fansub_staffers_on_fansub_id", using: :btree
  add_index "fansub_staffers", ["role"], name: "index_fansub_staffers_on_role", using: :btree
  add_index "fansub_staffers", ["staffer_id"], name: "index_fansub_staffers_on_staffer_id", using: :btree

  create_table "fansubs", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fansubs", ["name"], name: "index_fansubs_on_name", unique: true, using: :btree
  add_index "fansubs", ["owner_id"], name: "index_fansubs_on_owner_id", using: :btree

  create_table "shows", force: :cascade do |t|
    t.integer  "fansub_id"
    t.integer  "collaboration_id"
    t.string   "title"
    t.string   "short_title"
    t.integer  "episodes_count"
    t.integer  "status",           default: 0
    t.integer  "format",           default: 0
    t.date     "started_at"
    t.date     "ended_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "shows", ["collaboration_id"], name: "index_shows_on_collaboration_id", using: :btree
  add_index "shows", ["ended_at"], name: "index_shows_on_ended_at", using: :btree
  add_index "shows", ["fansub_id"], name: "index_shows_on_fansub_id", using: :btree
  add_index "shows", ["format"], name: "index_shows_on_format", using: :btree
  add_index "shows", ["short_title"], name: "index_shows_on_short_title", using: :btree
  add_index "shows", ["started_at"], name: "index_shows_on_started_at", using: :btree
  add_index "shows", ["status"], name: "index_shows_on_status", using: :btree
  add_index "shows", ["title"], name: "index_shows_on_title", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
