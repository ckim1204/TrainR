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

ActiveRecord::Schema.define(version: 20180118123352) do

  create_table "bodyparts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercisebodyparts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exercise_id"
    t.bigint "bodypart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bodypart_id"], name: "index_exercisebodyparts_on_bodypart_id"
    t.index ["exercise_id"], name: "index_exercisebodyparts_on_exercise_id"
  end

  create_table "exercises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "descr"
    t.string "imgURL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "injuries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "bodypart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bodypart_id"], name: "index_injuries_on_bodypart_id"
    t.index ["user_id"], name: "index_injuries_on_user_id"
  end

  create_table "muscleexercises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "muscle_id"
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_muscleexercises_on_exercise_id"
    t.index ["muscle_id"], name: "index_muscleexercises_on_muscle_id"
  end

  create_table "musclegroups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "muscles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "musclegroup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musclegroup_id"], name: "index_muscles_on_musclegroup_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "sex"
    t.date "birthdate"
    t.integer "height"
    t.integer "weight"
    t.bigint "usertype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usertype_id"], name: "index_users_on_usertype_id"
  end

  create_table "usertypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userworkouts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "repeats"
    t.string "weights"
    t.string "rests"
    t.bigint "user_id"
    t.bigint "workout_id"
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_userworkouts_on_exercise_id"
    t.index ["user_id"], name: "index_userworkouts_on_user_id"
    t.index ["workout_id"], name: "index_userworkouts_on_workout_id"
  end

  create_table "workouts", primary_key: ["workout_id", "exerciseorder"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "workout_id", default: 0, null: false
    t.integer "exerciseorder", default: 0, null: false
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_workouts_on_exercise_id"
  end

end
