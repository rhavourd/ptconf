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

<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20120627203945) do
=======
ActiveRecord::Schema.define(:version => 20120710133736) do
>>>>>>> jimjones
=======
ActiveRecord::Schema.define(:version => 20120710133736) do
>>>>>>> jimjones

  create_table "conference_dates", :force => true do |t|
    t.date     "date"
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "duration"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "reason"
  end

  add_index "conference_dates", ["user_id"], :name => "index_conference_dates_on_user_id"

  create_table "courses", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.date     "first_day"
    t.date     "last_day"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "dashboards", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "meetings", :force => true do |t|
    t.integer  "conference_date_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "meet_with"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "status",             :limit => 9
<<<<<<< HEAD
<<<<<<< HEAD
=======
    t.integer  "student_id"
    t.integer  "parent_id"
>>>>>>> jimjones
=======
    t.integer  "student_id"
    t.integer  "parent_id"
>>>>>>> jimjones
  end

  add_index "meetings", ["conference_date_id"], :name => "index_meetings_on_conference_date_id"

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "parents", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "nickname"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "email"
    t.string   "phone"
    t.boolean  "phone_has_sms"
  end

  add_index "parents", ["organization_id"], :name => "index_parents_on_organization_id"

  create_table "relationships", :force => true do |t|
    t.integer "student_id"
    t.integer "parent_id"
  end

  create_table "rosters", :force => true do |t|
    t.integer "student_id"
    t.integer "course_id"
  end

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "nickname"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "students", ["organization_id"], :name => "index_students_on_organization_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
  end

end
