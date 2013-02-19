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

ActiveRecord::Schema.define(:version => 20130218195025) do

  create_table "about_makes", :force => true do |t|
    t.string   "make"
    t.text     "summary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "articles", :force => true do |t|
    t.string   "permalink"
    t.string   "topic"
    t.string   "title"
    t.string   "keywords"
    t.string   "description"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "articles", ["permalink"], :name => "index_articles_on_permalink"

  create_table "buyers", :force => true do |t|
    t.string   "phone"
    t.string   "make"
    t.string   "model"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "miles"
    t.integer  "low_year"
    t.integer  "high_year"
    t.string   "color"
    t.boolean  "contact_me"
    t.string   "ip"
  end

  create_table "car_compass_facts", :force => true do |t|
    t.text     "fact"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "car_tips", :force => true do |t|
    t.string   "kind_of"
    t.text     "tip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dealers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "dealership"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "inventory_id"
    t.string   "logo"
    t.integer  "replies"
    t.string   "payment_id"
    t.boolean  "account_current"
    t.string   "cell_phone"
  end

  add_index "dealers", ["email"], :name => "index_dealers_on_email", :unique => true
  add_index "dealers", ["reset_password_token"], :name => "index_dealers_on_reset_password_token", :unique => true

  create_table "delivered_leads", :force => true do |t|
    t.integer  "dealer_id"
    t.integer  "buyer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spams", :force => true do |t|
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vehicle_statistics", :force => true do |t|
    t.integer  "vehicle_id"
    t.integer  "impressions"
    t.integer  "views"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "ip_address"
  end

  create_table "vehicles", :force => true do |t|
    t.integer  "dealer_id"
    t.boolean  "listed"
    t.integer  "price"
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.text     "description"
    t.integer  "mileage"
    t.string   "vin"
    t.integer  "city_mpg"
    t.integer  "highway_mpg"
    t.string   "transmission"
    t.string   "body"
    t.string   "exterior_color"
    t.string   "interior_color"
    t.string   "drivetrain"
    t.integer  "cylinders"
    t.text     "images"
    t.string   "car_type"
  end

end
