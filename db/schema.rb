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

ActiveRecord::Schema.define(version: 20170718045427) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "create_at"
    t.datetime "update_at"
    t.integer  "user_id"
  end

  create_table "aways", force: :cascade do |t|
    t.string  "stadium"
    t.integer "team_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string  "stadium"
    t.integer "team_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string   "result"
    t.integer  "home_id"
    t.integer  "away_id"
    t.integer  "hscore"
    t.integer  "ascore"
    t.datetime "date"
    t.float    "ratio"
  end

  create_table "records", force: :cascade do |t|
    t.integer "hscore"
    t.integer "ascore"
    t.string  "date"
    t.integer "home_id"
    t.integer "away_id"
    t.string  "result"
  end

  create_table "scoretables", force: :cascade do |t|
    t.integer "point"
    t.integer "team_id"
    t.integer "won"
    t.integer "drawn"
    t.integer "lost"
    t.integer "gf"
    t.integer "ga"
    t.integer "gd"
  end

  create_table "squads", force: :cascade do |t|
    t.string  "name"
    t.string  "position"
    t.integer "team_id"
    t.integer "xl"
    t.string  "avatar"
    t.string  "birth"
    t.string  "foot"
    t.string  "nationality"
    t.integer "goal"
    t.float   "gpm"
    t.integer "assist"
    t.integer "tackle"
    t.integer "blockshot"
    t.integer "interception"
    t.integer "clearance"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "coach"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "league_id"
    t.string   "avatar"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin",           default: false
  end

end
