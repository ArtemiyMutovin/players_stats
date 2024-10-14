# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_13_115815) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_game_statistics", force: :cascade do |t|
    t.float "rate", default: 0.0, null: false
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.bigint "statistic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id", null: false
    t.index ["game_id"], name: "index_player_game_statistics_on_game_id"
    t.index ["player_id"], name: "index_player_game_statistics_on_player_id"
    t.index ["statistic_id"], name: "index_player_game_statistics_on_statistic_id"
    t.index ["team_id"], name: "index_player_game_statistics_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "team_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_players_on_role_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "statistics", force: :cascade do |t|
    t.string "type", null: false
    t.jsonb "metrics", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_games", force: :cascade do |t|
    t.float "importance", default: 0.1, null: false
    t.boolean "home", default: false, null: false
    t.bigint "team_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_team_games_on_game_id"
    t.index ["team_id"], name: "index_team_games_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "player_game_statistics", "games"
  add_foreign_key "player_game_statistics", "players"
  add_foreign_key "player_game_statistics", "statistics"
  add_foreign_key "player_game_statistics", "teams"
  add_foreign_key "players", "roles"
  add_foreign_key "players", "teams"
  add_foreign_key "team_games", "games"
  add_foreign_key "team_games", "teams"
end
