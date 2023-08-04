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

ActiveRecord::Schema[7.0].define(version: 2023_08_04_045800) do
  create_table "employees", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "job_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_group_id"], name: "index_employees_on_job_group_id"
  end

  create_table "job_groups", force: :cascade do |t|
    t.string "category"
    t.decimal "wage", precision: 18, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pay_periods", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_reports", force: :cascade do |t|
    t.integer "report_id", null: false
    t.decimal "hours_worked", precision: 10, scale: 2, null: false
    t.date "work_date", null: false
    t.integer "job_group_id"
    t.integer "employee_id"
    t.integer "pay_period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_time_reports_on_employee_id"
    t.index ["job_group_id"], name: "index_time_reports_on_job_group_id"
    t.index ["pay_period_id"], name: "index_time_reports_on_pay_period_id"
  end

  add_foreign_key "employees", "job_groups"
  add_foreign_key "time_reports", "employees"
  add_foreign_key "time_reports", "job_groups"
  add_foreign_key "time_reports", "pay_periods"
end
