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

ActiveRecord::Schema[7.0].define(version: 2022_09_28_012807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "department_configurations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "weekly_hrs", default: 8
    t.integer "daily_hrs", default: 48
    t.uuid "department_id", null: false
    t.uuid "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_department_configurations_on_department_id"
    t.index ["organization_id"], name: "index_department_configurations_on_organization_id"
  end

  create_table "departments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "supervised_hrs", null: false, array: true
    t.uuid "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_departments_on_organization_id"
  end

  create_table "organizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.string "password_digest"
    t.integer "sign_in_count", default: 0
    t.integer "subscription", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "worker_available_hrs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "monday", null: false, array: true
    t.string "tuesday", null: false, array: true
    t.string "wednesday", null: false, array: true
    t.string "thursday", null: false, array: true
    t.string "friday", null: false, array: true
    t.string "saturday", null: false, array: true
    t.string "sunday", null: false, array: true
    t.uuid "worker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["worker_id"], name: "index_worker_available_hrs_on_worker_id"
  end

  create_table "worker_departments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "department_id", null: false
    t.uuid "worker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_worker_departments_on_department_id"
    t.index ["worker_id"], name: "index_worker_departments_on_worker_id"
  end

  create_table "workers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_workers_on_email", unique: true
  end

  add_foreign_key "department_configurations", "departments"
  add_foreign_key "department_configurations", "organizations"
  add_foreign_key "departments", "organizations"
  add_foreign_key "organizations", "users"
  add_foreign_key "worker_available_hrs", "workers"
  add_foreign_key "worker_departments", "departments"
  add_foreign_key "worker_departments", "workers"
end
