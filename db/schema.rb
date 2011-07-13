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

ActiveRecord::Schema.define(:version => 20110706171159) do

  create_table "jobs", :force => true do |t|
    t.string   "url"
    t.decimal  "depth"
    t.string   "parentRequest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.string   "url"
    t.decimal  "depth"
    t.string   "status"
    t.string   "issuedBy"
    t.decimal  "totalPages"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "depth"
    t.string   "parentRequest"
    t.text     "head"
    t.text     "body"
    t.text     "page"
    t.string   "respCode"
    t.text     "links"
    t.text     "description"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temp_repositories", :force => true do |t|
    t.string   "url"
    t.string   "parentRequest"
    t.text     "head"
    t.text     "body"
    t.string   "respCode"
    t.text     "links"
    t.string   "title"
    t.text     "html"
    t.text     "arr"
    t.text     "http"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
