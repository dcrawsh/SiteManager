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

ActiveRecord::Schema.define(version: 2019_12_12_230911) do

  create_table "employees", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "workdayid"
    t.integer "site_id"
  end

  create_table "employtrains", force: :cascade do |t|
    t.date "date"
    t.integer "employee_id"
    t.integer "training_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "siteid"
    t.integer "user_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

end
