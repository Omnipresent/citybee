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

ActiveRecord::Schema.define(:version => 20110909214237) do

  create_table "coupons", :force => true do |t|
    t.text     "coupon_code"
    t.integer  "times_allowed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", :force => true do |t|
    t.string   "title"
    t.integer  "min_needed"
    t.integer  "max_allowed"
    t.datetime "end_at"
    t.text     "summary"
    t.text     "fine_print"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured_deal"
    t.date     "expiration_date"
    t.string   "image_name"
  end

  create_table "downloaded_deals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "downloads", :force => true do |t|
    t.integer  "user_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "couponcode"
    t.integer  "coupon_id"
    t.integer  "offer_id"
    t.datetime "marked_used"
    t.integer  "influenced"
  end

  create_table "influences", :force => true do |t|
    t.integer  "user_id"
    t.integer  "download_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "influenced_used_id"
  end

  create_table "locations", :force => true do |t|
    t.integer  "deal_id"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", :force => true do |t|
    t.integer  "deal_id"
    t.integer  "price"
    t.integer  "value"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "somes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
