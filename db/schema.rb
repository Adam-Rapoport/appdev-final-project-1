# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_20_094026) do

  create_table "building_instructions", force: :cascade do |t|
    t.string "building_type_name"
    t.integer "points_value"
    t.integer "steel_cost"
    t.integer "clay_cost"
    t.integer "grain_cost"
    t.float "steel_drop_prob"
    t.float "clay_drop_prob"
    t.float "grain_drop_prob"
    t.integer "buildings_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.integer "building_type_id"
    t.integer "builder_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "kingdom"
    t.integer "steel_amount"
    t.integer "clay_amount"
    t.integer "grain_amount"
    t.integer "points"
    t.integer "buildings_count"
    t.integer "sent_requests_count"
    t.integer "received_requests_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.integer "steel_offered"
    t.integer "clay_offered"
    t.integer "grain_offered"
    t.integer "steel_requested"
    t.integer "clay_requested"
    t.integer "grain_requested"
    t.string "status"
    t.text "greetings"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
