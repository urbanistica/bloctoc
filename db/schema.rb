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

ActiveRecord::Schema.define(version: 2018_11_03_005313) do

  create_table "actors", force: :cascade do |t|
    t.text "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actors_blocs", id: false, force: :cascade do |t|
    t.integer "actor_id"
    t.integer "bloc_id"
  end

  create_table "blocs", force: :cascade do |t|
    t.decimal "lat1", precision: 10, scale: 5
    t.decimal "lat2", precision: 10, scale: 5
    t.decimal "lng1", precision: 10, scale: 5
    t.decimal "lng2", precision: 10, scale: 5
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
