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

ActiveRecord::Schema.define(version: 2019_05_14_113020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses_servers", id: false, force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "server_id", null: false
    t.index ["address_id", "server_id"], name: "index_addresses_servers_on_address_id_and_server_id"
    t.index ["server_id", "address_id"], name: "index_addresses_servers_on_server_id_and_address_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "server_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end