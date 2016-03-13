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

ActiveRecord::Schema.define(version: 20160311140230) do

  create_table "candidates", force: :cascade do |t|
    t.string  "position_running_for"
    t.string  "first_name"
    t.string  "last_name"
    t.date    "birthdate"
    t.string  "state"
    t.integer "district"
    t.string  "personality_type"
    t.text    "bio"
    t.text    "political_views"
    t.boolean "national_candidate"
    t.boolean "state_candidate"
    t.boolean "local_candidate"
    t.boolean "incumbent"
  end

  create_table "voters", force: :cascade do |t|
    t.string  "ssn"
    t.date    "birthdate"
    t.string  "email"
    t.string  "address"
    t.string  "state"
    t.integer "district"
    t.boolean "registration_status"
    t.string  "first_name"
    t.string  "last_name"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "voter_id"
    t.integer "candidate_id"
  end

end
