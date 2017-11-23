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

ActiveRecord::Schema.define(version: 20171123074257) do

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

  create_table "players", force: :cascade do |t|
    t.string   "first_name",                   limit: 255,                         null: false
    t.string   "last_name",                    limit: 255,                         null: false
    t.string   "display_name",                 limit: 255,                         null: false
    t.integer  "team_code",                    limit: 4
    t.string   "status",                       limit: 255
    t.integer  "code",                         limit: 4,                           null: false
    t.string   "photo",                        limit: 255
    t.integer  "squad_number",                 limit: 4
    t.integer  "cost",                         limit: 4
    t.integer  "cost_change_start",            limit: 4
    t.integer  "cost_change_gameweek",         limit: 4
    t.integer  "chance_of_playing_this_round", limit: 4
    t.integer  "chance_of_playing_next_round", limit: 4
    t.decimal  "value_form",                               precision: 3, scale: 1
    t.decimal  "value_season",                             precision: 3, scale: 1
    t.decimal  "selected_by_percent",                      precision: 4, scale: 1
    t.decimal  "form",                                     precision: 3, scale: 1
    t.integer  "transfers_out",                limit: 4
    t.integer  "transfers_in",                 limit: 4
    t.integer  "transfers_out_gameweek",       limit: 4
    t.integer  "transfers_in_gameweek",        limit: 4
    t.integer  "total_points",                 limit: 4
    t.decimal  "points_per_match",                         precision: 3, scale: 1
    t.integer  "minutes",                      limit: 4
    t.integer  "goals_scored",                 limit: 4
    t.integer  "assists",                      limit: 4
    t.integer  "clean_sheets",                 limit: 4
    t.integer  "goals_conceded",               limit: 4
    t.integer  "own_goals",                    limit: 4
    t.integer  "penalties_saved",              limit: 4
    t.integer  "penalties_missed",             limit: 4
    t.integer  "yellow_cards",                 limit: 4
    t.integer  "red_cards",                    limit: 4
    t.integer  "saves",                        limit: 4
    t.integer  "bonus",                        limit: 4
    t.integer  "bps",                          limit: 4
    t.decimal  "influence",                                precision: 6, scale: 1
    t.decimal  "creativity",                               precision: 5, scale: 1
    t.decimal  "threat",                                   precision: 5, scale: 1
    t.decimal  "ict_index",                                precision: 5, scale: 1
    t.integer  "position_id",                  limit: 4
    t.integer  "team_id",                      limit: 4
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  add_index "players", ["position_id"], name: "index_players_on_position_id", using: :btree
  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "short_name", limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "statlines", force: :cascade do |t|
    t.integer  "player_id",                       limit: 4,                         null: false
    t.integer  "match_team_id",                   limit: 4,                         null: false
    t.integer  "points",                          limit: 4,                         null: false
    t.integer  "value",                           limit: 4,                         null: false
    t.integer  "transfers_balance",               limit: 4
    t.integer  "selected",                        limit: 4
    t.integer  "transfers_in",                    limit: 4
    t.integer  "transfers_out",                   limit: 4
    t.integer  "minutes",                         limit: 4
    t.integer  "goals_scored",                    limit: 4
    t.integer  "assists",                         limit: 4
    t.integer  "clean_sheets",                    limit: 4
    t.integer  "goals_conceded",                  limit: 4
    t.integer  "own_goals",                       limit: 4
    t.integer  "penalties_saved",                 limit: 4
    t.integer  "penalties_missed",                limit: 4
    t.integer  "yellow_cards",                    limit: 4
    t.integer  "red_cards",                       limit: 4
    t.integer  "saves",                           limit: 4
    t.integer  "bonus",                           limit: 4
    t.integer  "bps",                             limit: 4
    t.decimal  "influence",                                 precision: 4, scale: 1
    t.decimal  "creativity",                                precision: 4, scale: 1
    t.decimal  "threat",                                    precision: 4, scale: 1
    t.decimal  "ict_index",                                 precision: 4, scale: 1
    t.integer  "open_play_crosses",               limit: 4
    t.integer  "big_chances_created",             limit: 4
    t.integer  "clearances_blocks_interceptions", limit: 4
    t.integer  "recoveries",                      limit: 4
    t.integer  "key_passes",                      limit: 4
    t.integer  "tackles",                         limit: 4
    t.integer  "winning_goals",                   limit: 4
    t.integer  "attempted_passes",                limit: 4
    t.integer  "completed_passes",                limit: 4
    t.integer  "penalties_conceded",              limit: 4
    t.integer  "big_chances_missed",              limit: 4
    t.integer  "errors_leading_to_goal",          limit: 4
    t.integer  "errors_leading_to_goal_attempt",  limit: 4
    t.integer  "tackled",                         limit: 4
    t.integer  "offside",                         limit: 4
    t.integer  "target_missed",                   limit: 4
    t.integer  "fouls",                           limit: 4
    t.integer  "dribbles",                        limit: 4
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
  end

  add_index "statlines", ["match_team_id"], name: "index_statlines_on_match_team_id", using: :btree
  add_index "statlines", ["player_id", "match_team_id"], name: "index_statlines_on_player_id_and_match_team_id", unique: true, using: :btree
  add_index "statlines", ["player_id"], name: "index_statlines_on_player_id", using: :btree

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
