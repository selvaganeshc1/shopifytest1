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

ActiveRecord::Schema.define(version: 20150527053014) do

  create_table "accounts", force: true do |t|
    t.string   "shopify_account_url"
    t.string   "shopify_api_key"
    t.string   "shopify_password"
    t.string   "shopify_shared_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "ssl_enabled"
    t.string   "text"
  end

  create_table "daily", primary_key: "id_daily", force: true do |t|
    t.date    "date"
    t.integer "id_daily_learn"
    t.integer "id_expence"
    t.integer "id_ppl"
    t.string  "tag",            limit: 45
    t.integer "id_work"
    t.integer "id_plan"
  end

  create_table "expence", primary_key: "expence_id", force: true do |t|
    t.string  "name",            limit: 45
    t.string  "tag",             limit: 45
    t.string  "detail",          limit: 45
    t.date    "date"
    t.integer "amount"
    t.integer "ppl_id"
    t.integer "intelligence_id"
  end

  create_table "ideas", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "intelligence", primary_key: "id_intelligence", force: true do |t|
    t.string  "tag",      limit: 45
    t.string  "detail",   limit: 45
    t.date    "date"
    t.integer "issue_id"
    t.integer "learn_id"
  end

  create_table "issue", primary_key: "issue_id", force: true do |t|
    t.string  "tag",        limit: 45
    t.string  "mistake",    limit: 45
    t.string  "fact",       limit: 45
    t.string  "correction", limit: 45
    t.integer "learn_id"
    t.integer "ppl_id"
    t.date    "date"
  end

  create_table "learn", primary_key: "id_learn", force: true do |t|
    t.string  "tag",        limit: 45
    t.string  "detail",     limit: 45
    t.string  "url",        limit: 45
    t.string  "date",       limit: 45
    t.integer "id_plan"
    t.integer "id_schdule"
    t.integer "id_dev"
    t.integer "id_issue"
  end

  add_index "learn", ["id_dev"], name: "id_dev_UNIQUE", unique: true, using: :btree
  add_index "learn", ["id_issue"], name: "id_issue_UNIQUE", unique: true, using: :btree
  add_index "learn", ["id_plan"], name: "id_plan_UNIQUE", unique: true, using: :btree
  add_index "learn", ["id_schdule"], name: "id_schdule_UNIQUE", unique: true, using: :btree

  create_table "personal", primary_key: "id_personal", force: true do |t|
    t.date   "date"
    t.string "tag",     limit: 45
    t.string "name",    limit: 45
    t.string "detail",  limit: 45
    t.string "website", limit: 45
    t.string "web_pwd", limit: 45
  end

  add_index "personal", ["tag"], name: "tag_UNIQUE", unique: true, using: :btree
  add_index "personal", ["website"], name: "website_UNIQUE", unique: true, using: :btree

  create_table "plan", primary_key: "id_plan", force: true do |t|
    t.string  "tag",        limit: 45
    t.string  "detail",     limit: 45
    t.string  "name",       limit: 45
    t.date    "date"
    t.date    "due_date"
    t.integer "id_dev"
    t.integer "id_learn"
    t.integer "id_schdule"
  end

  add_index "plan", ["id_dev"], name: "id_dev_UNIQUE", unique: true, using: :btree
  add_index "plan", ["id_learn"], name: "id_learn_UNIQUE", unique: true, using: :btree
  add_index "plan", ["id_schdule"], name: "id_schdule_UNIQUE", unique: true, using: :btree

  create_table "ppl", primary_key: "id_ppl", force: true do |t|
    t.string  "name",     limit: 45
    t.string  "tag",      limit: 45
    t.integer "issue_id"
    t.string  "detail",   limit: 45
    t.date    "date"
  end

  create_table "schdule", primary_key: "schdule_id", force: true do |t|
    t.string  "tag",       limit: 45
    t.string  "detail",    limit: 45
    t.date    "date"
    t.string  "dew_date",  limit: 45
    t.string  "prioarity", limit: 45
    t.string  "message",   limit: 45
    t.integer "id_dev"
    t.integer "id_issue"
  end

  add_index "schdule", ["id_dev"], name: "id_dev_UNIQUE", unique: true, using: :btree
  add_index "schdule", ["id_issue"], name: "id_issue_UNIQUE", unique: true, using: :btree

  create_table "tag", primary_key: "id_tag", force: true do |t|
    t.string "tag",    limit: 45
    t.string "detail", limit: 45
    t.date   "date"
  end

  create_table "tests", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work", primary_key: "id_work", force: true do |t|
    t.string  "id_issue",   limit: 45
    t.string  "id_dev",     limit: 45
    t.date    "date"
    t.string  "tag",        limit: 45
    t.integer "id_learn"
    t.integer "id_schdule"
    t.integer "id_plan"
    t.integer "id_ppl"
  end

  add_index "work", ["id_dev"], name: "dev_id_UNIQUE", unique: true, using: :btree
  add_index "work", ["id_issue"], name: "issue_id_UNIQUE", unique: true, using: :btree
  add_index "work", ["id_learn"], name: "learn_id_UNIQUE", unique: true, using: :btree
  add_index "work", ["id_plan"], name: "plan_id_UNIQUE", unique: true, using: :btree
  add_index "work", ["id_ppl"], name: "ppl_id_UNIQUE", unique: true, using: :btree
  add_index "work", ["id_schdule"], name: "schdule_id_UNIQUE", unique: true, using: :btree

end
