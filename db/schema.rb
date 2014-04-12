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

ActiveRecord::Schema.define(version: 20140412202528) do

  create_table "asteroids", force: true do |t|
    t.string   "ref_num"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galeries", force: true do |t|
    t.datetime "date_taken"
    t.integer  "asteroid_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "galeries", ["asteroid_id"], name: "index_galeries_on_asteroid_id"

  create_table "sightings", force: true do |t|
    t.datetime "date_sighted"
    t.decimal  "ra"
    t.decimal  "dec"
    t.string   "magn"
    t.string   "location"
    t.integer  "asteroid_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sightings", ["asteroid_id"], name: "index_sightings_on_asteroid_id"

end
