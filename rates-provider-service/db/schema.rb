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

ActiveRecord::Schema.define(version: 2019_08_10_190502) do

  create_table "shipping_companies", force: :cascade do |t|
    t.string "company_name"
    t.float "flat_shipping_rate_usd"
  end

  create_table "shipping_company_rates", force: :cascade do |t|
    t.float "shipping_rate_usd"
    t.string "origin_code"
    t.string "destination_code"
    t.integer "company_id"
  end

end
