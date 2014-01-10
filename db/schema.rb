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

ActiveRecord::Schema.define(version: 20140109172633) do

  create_table "panels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "panel_id"
    t.integer  "application_number"
    t.string   "applicant_name"
    t.integer  "applicant_level"
    t.float    "avg_z_score"
    t.string   "quality_group"
    t.integer  "rank"
    t.string   "reviewer_1"
    t.integer  "raw_score_1"
    t.float    "z_score_1"
    t.string   "reviewer_2"
    t.integer  "raw_score_2"
    t.float    "z_score_2"
    t.string   "reviewer_3"
    t.integer  "raw_score_3"
    t.float    "z_score_3"
    t.string   "reviewer_4"
    t.integer  "raw_score_4"
    t.float    "z_score_4"
    t.integer  "former_rank"
  end

end
