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

ActiveRecord::Schema.define(version: 20171120063632) do

  create_table "gameweeks", force: :cascade do |t|
    t.string   "name",                limit: 255, null: false
    t.integer  "number",              limit: 4,   null: false
    t.datetime "deadline_time",                   null: false
    t.integer  "deadline_time_epoch", limit: 4,   null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "gameweeks", ["number"], name: "index_gameweeks_on_number", unique: true, using: :btree

  create_table "match_teams", force: :cascade do |t|
    t.integer  "match_id",   limit: 4,   null: false
    t.integer  "team_id",    limit: 4,   null: false
    t.string   "side",       limit: 255, null: false
    t.integer  "difficulty", limit: 4,   null: false
    t.integer  "goals",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "match_teams", ["match_id", "team_id"], name: "index_match_teams_on_match_id_and_team_id", unique: true, using: :btree
  add_index "match_teams", ["match_id"], name: "index_match_teams_on_match_id", using: :btree
  add_index "match_teams", ["team_id"], name: "index_match_teams_on_team_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "gameweek_id",  limit: 4, null: false
    t.integer  "event_day",    limit: 4, null: false
    t.integer  "code",         limit: 4, null: false
    t.datetime "kickoff_time",           null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "matches", ["code"], name: "index_matches_on_code", using: :btree
  add_index "matches", ["gameweek_id"], name: "index_matches_on_gameweek_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",                  limit: 255, null: false
    t.string   "short_name",            limit: 255, null: false
    t.integer  "code",                  limit: 4,   null: false
    t.integer  "strength",              limit: 4
    t.integer  "strength_overall_home", limit: 4
    t.integer  "strength_overall_away", limit: 4
    t.integer  "strength_attack_home",  limit: 4
    t.integer  "strength_attack_away",  limit: 4
    t.integer  "strength_defence_home", limit: 4
    t.integer  "strength_defence_away", limit: 4
    t.integer  "team_division",         limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "teams", ["code"], name: "index_teams_on_code", unique: true, using: :btree

end
