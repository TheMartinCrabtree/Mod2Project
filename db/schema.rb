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


ActiveRecord::Schema.define(version: 2019_08_20_151715) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dungeonmasters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "username"
  end

  create_table "encountermonsters", force: :cascade do |t|
    t.bigint "encounter_id"
    t.bigint "monster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encounter_id"], name: "index_encountermonsters_on_encounter_id"
    t.index ["monster_id"], name: "index_encountermonsters_on_monster_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.bigint "dungeonmaster_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dungeonmaster_id"], name: "index_encounters_on_dungeonmaster_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "monster_name"
    t.string "monster_type"
    t.string "monster_size"
    t.string "monster_alignment"
    t.integer "armor_class"
    t.integer "hit_points"
    t.float "challenge_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playerencounters", force: :cascade do |t|
    t.string "name"
    t.bigint "player_id"
    t.bigint "encounter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encounter_id"], name: "index_playerencounters_on_encounter_id"
    t.index ["player_id"], name: "index_playerencounters_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "player_hp"
    t.integer "player_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dungeonmaster_id"
    t.index ["dungeonmaster_id"], name: "index_players_on_dungeonmaster_id"
  end

  add_foreign_key "encountermonsters", "encounters"
  add_foreign_key "encountermonsters", "monsters"
  add_foreign_key "encounters", "dungeonmasters"
  add_foreign_key "playerencounters", "encounters"
  add_foreign_key "playerencounters", "players"
  add_foreign_key "players", "dungeonmasters"
end
