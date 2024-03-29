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

ActiveRecord::Schema.define(version: 20140527034201) do

  create_table "accounts", force: true do |t|
    t.string   "name",                                     null: false
    t.string   "email"
    t.string   "assigned_to"
    t.string   "website"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid",               limit: 40
    t.integer  "organization_id"
    t.integer  "max_users",                    default: 1, null: false
    t.integer  "subscription_plan",                        null: false
  end

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "bootsy_image_galleries", force: true do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: true do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_listings", force: true do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "renting",    default: false
    t.boolean  "selling",    default: false
  end

  add_index "client_listings", ["user_id", "listing_id"], name: "index_client_listings_on_user_id_and_listing_id", unique: true, using: :btree

  create_table "contacts", force: true do |t|
    t.string   "first_name",                  null: false
    t.string   "last_name",                   null: false
    t.string   "company"
    t.string   "email",                       null: false
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "lead_owner"
    t.string   "uid",              limit: 40
    t.integer  "account_id"
    t.integer  "assignee_id"
    t.integer  "user_id"
    t.string   "lead_type"
    t.string   "lead_status"
    t.string   "lead_source"
    t.text     "comments"
    t.string   "opportunity_name"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "due_date"
    t.string   "assigned_to"
    t.string   "task_type"
    t.string   "lead_for_task"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid",             limit: 40
    t.integer  "organization_id"
    t.string   "type"
    t.datetime "ends"
    t.boolean  "all_day",                    default: false
    t.integer  "contact_id"
    t.text     "notes"
  end

  create_table "listings", force: true do |t|
    t.string   "title"
    t.decimal  "price",          precision: 8, scale: 2
    t.integer  "house_number"
    t.string   "street_name"
    t.string   "city_name"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "listing_number"
    t.string   "listing_owner"
    t.string   "state"
    t.string   "creating_agent"
    t.integer  "account_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "full_address"
    t.text     "description"
    t.string   "beds",                                   default: "N/A"
    t.string   "baths",                                  default: "N/A"
    t.string   "house_size",                             default: "N/A"
    t.string   "property_type",                          default: "N/A"
    t.integer  "stories",                                default: 0
    t.string   "lot_size",                               default: "N/A"
    t.string   "year_built",                             default: "N/A"
    t.string   "garage",                                 default: "N/A"
  end

  add_index "listings", ["price"], name: "index_listings_on_price", using: :btree
  add_index "listings", ["zipcode"], name: "index_listings_on_zipcode", using: :btree

  create_table "notes", force: true do |t|
    t.string   "content"
    t.string   "note_type",             null: false
    t.datetime "due_date",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid",        limit: 40
    t.integer  "lead_id"
    t.integer  "contact_id"
  end

  create_table "offers", force: true do |t|
    t.integer  "contact_id"
    t.integer  "listing_id"
    t.integer  "agent_id"
    t.string   "offer_amount"
    t.datetime "offer_sent_at"
    t.datetime "offer_expiration"
    t.string   "counter_offer_amount"
    t.datetime "counter_offer_received_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",                     precision: 10, scale: 0
    t.string   "seller_name"
  end

  add_index "offers", ["agent_id"], name: "index_offers_on_agent_id", using: :btree
  add_index "offers", ["contact_id"], name: "index_offers_on_contact_id", using: :btree
  add_index "offers", ["listing_id"], name: "index_offers_on_listing_id", using: :btree

  create_table "opportunities", force: true do |t|
    t.string   "opportunity_name",               null: false
    t.string   "contact_person_name"
    t.string   "amount"
    t.string   "stage"
    t.string   "owner",                          null: false
    t.string   "probability"
    t.string   "contact_name",                   null: false
    t.string   "comments"
    t.datetime "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid",                 limit: 40
    t.integer  "account_id"
    t.string   "opportunity_type"
  end

  create_table "plans", force: true do |t|
    t.string   "name",                               null: false
    t.decimal  "price",      precision: 8, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plans", ["price"], name: "index_plans_on_price", using: :btree

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id",               null: false
    t.integer  "plan_id",               null: false
    t.string   "stripe_customer_token"
    t.string   "card_zip"
    t.string   "last_four"
    t.string   "card_type"
    t.date     "next_bill_on"
    t.string   "card_expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", unique: true, using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                             default: "",                   null: false
    t.string   "encrypted_password",                default: "",                   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,                    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "phone"
    t.string   "account_role"
    t.string   "uid",                    limit: 40
    t.integer  "account_id"
    t.string   "background",                        default: "default-background"
    t.string   "task_color",                        default: "#428bca"
    t.string   "appointment_color",                 default: "#5cb85c"
    t.string   "showing_color",                     default: "#d9534f"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
