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

ActiveRecord::Schema.define(version: 20160820031852) do

  create_table "educations", force: :cascade do |t|
    t.date   "period_begin"
    t.date   "period_end"
    t.string "title"
    t.string "description"
  end

  create_table "experience_skills", force: :cascade do |t|
    t.integer  "experience_id"
    t.integer  "skill_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "nb_months",     default: 0
    t.index ["experience_id"], name: "index_experience_skills_on_experience_id"
    t.index ["skill_id"], name: "index_experience_skills_on_skill_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.date     "period_begin"
    t.date     "period_end"
    t.string   "company"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "url"
    t.boolean  "is_current",   default: false
  end

  create_table "general_infos", force: :cascade do |t|
    t.text     "data",       limit: 100000
    t.string   "linkedin"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "skill_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "skill_category_id"
    t.index ["skill_category_id"], name: "index_skills_on_skill_category_id"
  end

end
