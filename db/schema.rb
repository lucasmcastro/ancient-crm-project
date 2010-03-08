# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100308210027) do

  create_table "accounts", :force => true do |t|
    t.integer  "manager_id"
    t.integer  "creator_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cnpj"
    t.string   "legal_name"
  end

  create_table "addresses", :force => true do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.string   "zip"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city_area"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_forms", :force => true do |t|
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.integer  "contact_type_id"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_types", :force => true do |t|
    t.string   "category"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facts", :force => true do |t|
    t.integer  "informable_id"
    t.string   "informable_type"
    t.integer  "information_category_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "information", :force => true do |t|
    t.integer  "informable_id"
    t.string   "informable_type"
    t.integer  "information_category_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "information_categories", :force => true do |t|
    t.string   "name"
    t.string   "category_type"
    t.string   "data_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interaction_types", :force => true do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interactions", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "opportunity_id"
    t.integer  "type_id"
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issue_statuses", :force => true do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "opportunity_id"
    t.integer  "status_id"
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "responsible_id"
  end

  create_table "notes", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commentable_version"
  end

  create_table "opportunities", :force => true do |t|
    t.integer  "account_id"
    t.integer  "manager_id"
    t.integer  "creator_id"
    t.integer  "product_id"
    t.integer  "opportunity_status_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opportunity_statuses", :force => true do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "forename"
    t.string   "surname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", :force => true do |t|
    t.integer  "callable_id"
    t.string   "callable_type"
    t.string   "number"
    t.string   "description"
    t.string   "company"
    t.string   "phone_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "versions", :force => true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.text     "changes"
    t.integer  "number"
    t.datetime "created_at"
  end

  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["versioned_type", "versioned_id"], :name => "index_versions_on_versioned_type_and_versioned_id"

end
