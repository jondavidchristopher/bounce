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

ActiveRecord::Schema.define(version: 20131201055357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "ticker"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["ticker"], name: "index_companies_on_ticker", unique: true, using: :btree

  create_table "company_trade_histories", force: true do |t|
    t.integer  "company_id"
    t.date     "date"
    t.float    "open"
    t.float    "high"
    t.float    "low"
    t.float    "close"
    t.float    "adjusted_close"
    t.integer  "volume"
    t.float    "sma_50"
    t.float    "sma_100"
    t.float    "sma_200"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_trade_histories", ["adjusted_close"], name: "index_company_trade_histories_on_adjusted_close", using: :btree
  add_index "company_trade_histories", ["close"], name: "index_company_trade_histories_on_close", using: :btree
  add_index "company_trade_histories", ["company_id"], name: "index_company_trade_histories_on_company_id", using: :btree
  add_index "company_trade_histories", ["high"], name: "index_company_trade_histories_on_high", using: :btree
  add_index "company_trade_histories", ["id", "date"], name: "index_company_trade_histories_on_id_and_date", unique: true, using: :btree
  add_index "company_trade_histories", ["low"], name: "index_company_trade_histories_on_low", using: :btree
  add_index "company_trade_histories", ["open"], name: "index_company_trade_histories_on_open", using: :btree
  add_index "company_trade_histories", ["sma_100"], name: "index_company_trade_histories_on_sma_100", using: :btree
  add_index "company_trade_histories", ["sma_200"], name: "index_company_trade_histories_on_sma_200", using: :btree
  add_index "company_trade_histories", ["sma_50"], name: "index_company_trade_histories_on_sma_50", using: :btree
  add_index "company_trade_histories", ["volume"], name: "index_company_trade_histories_on_volume", using: :btree

end
