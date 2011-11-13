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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111113104620) do

  create_table "actors", :force => true do |t|
    t.string   "name"
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "actors", ["entry_id"], :name => "index_actors_on_entry_id"

  create_table "directors", :force => true do |t|
    t.string   "name"
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "directors", ["entry_id"], :name => "index_directors_on_entry_id"

  create_table "entries", :force => true do |t|
    t.string   "title"
    t.string   "year"
    t.string   "plot"
    t.string   "rating"
    t.string   "poster"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genres", ["entry_id"], :name => "index_genres_on_entry_id"

  create_table "writers", :force => true do |t|
    t.string   "name"
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "writers", ["entry_id"], :name => "index_writers_on_entry_id"

end
